#!/usr/bin/env python
# coding: utf-8
#
# Tests
#
# Copyright (C) 2013-2015 by Thomas T. <ekklesia@heterarchy.net>
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
# 
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
# 
# You should have received a copy of the GNU Affero General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
# For more details see the file COPYING.

"""
general:
import = export (all fields)
encrypt/sign = decrypt/verify
dryrun doesnt modify data
expected errors (collect)
empty fields autogenerated
api down/upload
missing pgp keys

members:
selective exports / sync

invitation:
correct recipients

joint:
same results als independent
"""

"""
member,1.0
uuid,email,status,verified,department,parent
uid1,bar@localhost,member,n,sub,root
uid2,fnord@localhost,eligible,y,subsub,sub
uid3,verify@localhost,eligible,y,sub2,root
uid4,other@localhost,member,y,subsub,sub

member 1.0
memberno,uuid,entitled,verified,email,department,parent,address
101,uid1,1,1,user1@local,Local,City,"Street 1, City, State"
102,uid2,1,0,user2@local,City,State,"Tiananmen, Dongcheng, Beijing, China, 100051"
103,uid3,0,1,user3@local,State,,
104,uid4,1,1,,County,State,"Brandenburger Tor, Berlin, Germany"
105,,1,1,,Subcounty,County,
"""

import os, copy
from ekklesia.backends.members import MemberDatabase, MStatusType
from ekklesia.backends.joint import MemberInvDatabase
from pytest import yield_fixture, fixture, raises, mark
from ekklesia.tests.conftest import pytest_addoption, sender, receiver, third, keys, bilateral
import json
from sqlalchemy import create_engine
from six.moves import cStringIO as StringIO

class MyMemberDatabase(MemberDatabase):
    def check_member_func(self,member,check):
        return member.uuid in ('uid1','uid2') and check=='password'

class MyMemberInvDatabase(MemberInvDatabase):
    def check_member_func(self,member,check):
        return member.uuid in ('uid1','uid2') and check=='password'

deps_name = """department,1.0
name,parent,depth
root,,0
subsub,sub,3
sub,root,1
sub2,root,1
sub3,root,
"""
deps_number = """department,1.0
id,name,parent,depth
1,root,,0
2,subsub,3,3
3,sub,1,1
4,sub2,1,1
5,sub3,1,
"""
members_name = """member,1.0
uuid,email,status,verified,department
uid1,bar@localhost,member,n,sub
uid2,fnord@localhost,eligible,y,subsub
uid3,verify@localhost,eligible,y,sub2
uid4,other@localhost,member,y,subsub
"""
members_number = """member,1.0
memberno,uuid,email,status,verified,department
1,uid1,bar@localhost,member,n,3
2,uid2,fnord@localhost,eligible,y,2
3,uid3,verify@localhost,eligible,y,4
4,uid4,other@localhost,member,y,2
"""
members_implict = """member,1.0
uuid,email,status,verified,department,parent
uid1,bar@localhost,member,n,sub,root
uid2,fnord@localhost,eligible,y,subsub,sub
uid3,verify@localhost,eligible,y,sub2,root
uid4,other@localhost,member,y,subsub,sub
"""

def gen_departments(db,spec='name'):
    root = db.Department(name='root',parent=None,depth=0)
    sub = db.Department(name='sub',parent=root,depth=1)
    sub2 = db.Department(name='sub2',parent=root,depth=1)
    sub3 = db.Department(name='sub3',parent=root,depth=1)
    subsub = db.Department(name='subsub',parent=sub,depth=2 if spec=='implicit' else 3)
    if spec=='number': root.id, subsub.id, sub.id, sub2.id, sub3.id = 1,2,3,4,5
    deps = dict(root=root,sub=sub,sub2=sub2,subsub=subsub)
    if spec!='implicit': deps['sub3'] = sub3
    return deps

def gen_members(db,deps):
    m1 = db.Member(uuid='uid1',email=receiver,status=MStatusType.member,
        verified=False,department=deps['sub'])
    m2 = db.Member(uuid='uid2',email=third,status=MStatusType.eligible,
        verified=True,department=deps['subsub'])
    m3 = db.Member(uuid='uid3',email='verify@localhost',status=MStatusType.eligible,
        verified=True,department=deps['sub2'])
    m4 = db.Member(uuid='uid4',email='other@localhost',status=MStatusType.member,
        verified=True,department=deps['subsub'])
    return (m1,m2,m3,m4)

def check_objs(db,deps=None,members=None,spec='name'):
    if not deps: deps = gen_departments(db,spec)
    if not members: members = gen_members(db,deps)
    session = db.session
    qdep = session.query(db.Department)
    qmem = session.query(db.Member)
    assert len(deps) == qdep.count()
    for dep in deps.values():
        tdep = qdep.filter_by(name=dep.name,depth=dep.depth).one()
        assert spec!='number' or dep.id == tdep.id
        assert not dep.parent or dep.parent.name == tdep.parent.name
    assert len(members) == qmem.count()
    for mem in members:
        tmem = qmem.filter_by(uuid=mem.uuid,email=mem.email,status=mem.status,verified=mem.verified).one()
        assert mem.department.name == tmem.department.name

current_db = None # ugly workaround for pytest bug (finalizer not called immeditely)

def setup_db(dbtype=MyMemberDatabase,engine=None,depspec='name',reflect=True,**configs):
    import logging
    global current_db
    if current_db: current_db.drop_db()
    config = dict(department_spec=depspec,check_member='register',
            export_emails=True, email_receiver=receiver, io_key=receiver,
            member_import=('id','uuid','email','status','verified','department','registered'))
    db = dbtype().configure(config=config,gpgconfig=dict(sender=sender),**configs)
    db.set_logger('member','warning')
    log = logging.getLogger('sqlalchemy')
    log.setLevel(logging.WARNING)
    log = logging.getLogger('gnupg')
    log.setLevel(logging.ERROR)
    if not engine:
        engine = create_engine(db.database,echo=False)
    db.open_db(engine,mode='dropall')
    db.open_db(engine,mode='create')
    if reflect: db.open_db(engine,mode='open') # and reflect
    current_db = db
    return db

def stop_db(db,engine=None):
    global current_db
    if current_db!=db:
        print('already finalized %s' % repr(db))
        return
    db.drop_db()
    db.stop_logger()
    db.session.close()
    current_db = None

@fixture(scope='module')
def dbconnection(request):
    from sqlalchemy import create_engine
    db = request.config.getoption('db',None)
    if not db: return None
    return create_engine(db,echo=False)

@yield_fixture(params=[MyMemberDatabase,MyMemberInvDatabase],scope='module')
def dbsession(dbconnection, request):
    engine = dbconnection
    db = setup_db(request.param,engine=engine)
    db.session.flush()
    #db.session.commit = db.session.flush
    yield db
    stop_db(db,engine)

@yield_fixture
def empty_db(dbsession,request,monkeypatch):
    # Roll back at the end of every test
    monkeypatch.setattr(dbsession.session, 'commit', dbsession.session.flush)
    yield dbsession
    dbsession.session.rollback()

@fixture
def member_db(empty_db):
    db = empty_db
    deps = gen_departments(db,'number')
    members = gen_members(db,deps)
    db.session.add_all(list(deps.values())+list(members))
    db.session.flush()
    return db

@yield_fixture(params=["name","number","implicit"],scope='module')
def depspec_db(dbconnection,request):
    spec = request.param
    db = setup_db(depspec=spec,engine=dbconnection)
    db.session.commit = db.session.flush
    yield db, spec
    stop_db(db,dbconnection)

def test_import(depspec_db):
    db, spec = depspec_db
    if spec=='implicit':
        depfile = None
        memfile = StringIO(members_implict)
    elif spec=='name':
        depfile = StringIO(deps_name)
        memfile = StringIO(members_name)
    elif spec=='number':
        depfile = StringIO(deps_number)
        memfile = StringIO(members_number)
    db.import_members(memberfile=memfile,depfile=depfile)
    check_objs(db,spec=spec)
    db.session.rollback()

@yield_fixture(params=[MyMemberDatabase,MyMemberInvDatabase],scope='module')
def noreflect_db(dbconnection,request):
    db = setup_db(request.param,reflect=False,engine=dbconnection)
    db.session.commit = db.session.flush
    yield db
    stop_db(db,dbconnection)

def test_import_init(noreflect_db):
    db = noreflect_db
    depfile = StringIO(deps_name)
    memfile = StringIO(members_name)
    db.import_members(memberfile=memfile,depfile=depfile)
    check_objs(db)
    db.session.rollback()

def test_reimport(member_db):
    depfile = StringIO(deps_name)
    memfile = StringIO(members_name)
    member_db.import_members(memberfile=memfile,depfile=depfile)
    check_objs(member_db)

def test_import_delete(member_db):
    db = member_db
    depfile = StringIO(deps_name)
    members = ''.join(members_name.splitlines(True)[:-1]) # remove last row
    memfile = StringIO(members)
    db.import_members(memberfile=memfile,depfile=depfile,sync=True)
    query = db.session.query(db.Member)
    assert query.count()==4
    assert query.filter_by(uuid='uid4').one().status == MStatusType.deleted

def test_import_crypt(empty_db,bilateral):
    db = empty_db
    id2 = bilateral['id2']
    result = id2.encrypt_str(members_name,[sender],sign=True)
    assert result.ok
    memfile = StringIO(str(result))
    result = id2.encrypt_str(deps_name,[sender],sign=True)
    assert result.ok
    depfile = StringIO(str(result))
    db.gpg = bilateral['id1']
    db.import_members(memberfile=memfile,depfile=depfile,decrypt=True,verify=receiver)
    check_objs(db)

deps_dup = """department,1.0
name,parent,depth
root,,0
subsub,sub,3
sub,root,1
sub2,root,1
sub2,sub,2
sub3,root,
"""

members_dup = """member,1.0
uuid,email,status,verified,department
uid1,bar@localhost,member,n,sub
uid2,fnord@localhost,eligible,y,subsub
uid3,verify@localhost,eligible,y,sub2
uid2,foo@localhost,eligible,n,subsub
uid4,other@localhost,member,y,subsub
"""

def test_import_dupdep(empty_db):
    memfile = StringIO(members_name)
    depfile = StringIO(deps_dup)
    with raises(AssertionError):
        empty_db.import_members(memberfile=memfile,depfile=depfile)

def test_import_dupmem(empty_db):
    memfile = StringIO(members_dup)
    depfile = StringIO(deps_name)
    with raises(AssertionError):
        empty_db.import_members(memberfile=memfile,depfile=depfile)

deps_cycle = """department,1.0
name,parent,depth
root,subsub,
subsub,sub,
sub,root,
sub2,,
sub3,root,
"""

def test_import_cycle(empty_db):
    memfile = StringIO(members_name)
    depfile = StringIO(deps_cycle)
    with raises(AssertionError):
        empty_db.import_members(memberfile=memfile,depfile=depfile)

deps_depths = """department,1.0
name,parent
root,
subsub,sub
sub,root
sub2,root
"""

def test_import_depths(empty_db):
    db = empty_db
    memfile = StringIO(members_name)
    depfile = StringIO(deps_depths)
    #for dep in db.session.query(db.Department): print dep
    db.import_members(memberfile=memfile,depfile=depfile)
    deps = gen_departments(db,'implicit')
    members = gen_members(db,deps)
    check_objs(db,deps,members)

members_export = """member,1.0
uuid,email,status,registered,verified,department
uid1,bar@localhost,member,,False,sub
uid2,fnord@localhost,eligible,,True,subsub
uid3,verify@localhost,eligible,,True,sub2
uid4,other@localhost,member,,True,subsub
"""

deps_export = """department,1.0
id,name,parent,depth
1,root,,0
3,sub,root,1
4,sub2,root,1
5,sub3,root,1
2,subsub,sub,3
"""

def test_export(member_db):
    memfile = StringIO()
    depfile = StringIO()
    member_db.export_members([memfile,depfile],allfields=True,format='csv')
    assert memfile.getvalue()==members_export
    assert depfile.getvalue()==deps_export

def test_export_inv(member_db):
    memfile = StringIO()
    member_db.export_members([memfile],allfields=False,format='csv')
    assert memfile.getvalue()=="""invitation,1.0
uuid,email
uid1,bar@localhost
uid2,fnord@localhost
uid3,verify@localhost
uid4,other@localhost
"""

deps_dictname = {'format': 'department', 'version': [1, 0],
        'fields': ['id', 'name', 'parent', 'depth'],
        'data': [[1, 'root', None, 0],
            [3, 'sub', 'root', 1],
            [4, 'sub2', 'root', 1],
            [5, 'sub3', 'root', 1],
            [2, 'subsub', 'sub', 3]]
        }

def test_export_json(member_db):
    memfile = StringIO()
    depfile = StringIO()
    member_db.export_members([memfile,depfile],allfields=True,format='json-file')
    members = json.loads(memfile.getvalue())
    deps = json.loads(depfile.getvalue())
    assert members == {'format': 'member', 'version': [1, 0],
        'fields': ['uuid', 'email', 'status', 'registered', 'verified', 'department'],
        'data': [['uid1', 'bar@localhost', 'member', None, False, 'sub'],
            ['uid2', 'fnord@localhost', 'eligible', None, True, 'subsub'],
            ['uid3', 'verify@localhost', 'eligible', None, True, 'sub2'],
            ['uid4', 'other@localhost', 'member', None, True, 'subsub']]
    }
    assert deps == deps_dictname

def test_export_crypt(member_db,bilateral):
    #member_db.gpgbackend = bilateral['gpg1']
    member_db.gpg = bilateral['id1']
    memfile = StringIO()
    depfile = StringIO()
    member_db.export_members([memfile,depfile],allfields=True,encrypt=True,sign=True,format='csv')
    id2 = bilateral['id2']
    result = id2.decrypt_str(memfile.getvalue())
    assert result.ok and result.valid
    members = str(result)
    assert members==members_export
    result = id2.decrypt_str(depfile.getvalue())
    assert result.ok and result.valid
    deps = str(result)
    assert deps==deps_export

deps_dict = {'format': 'department', 'version': [1, 0],
        'fields': ['id', 'name', 'parent', 'depth'],
        'data': [[1, 'root', None, 0],
            [3, 'sub', 1, 1],
            [4, 'sub2', 1, 1],
            [5, 'sub3', 1, 1],
            [2, 'subsub', 3, 3]]
        }

members_down = {'format': 'member', 'version': [1, 0], 'fields': ['uuid', 'register'], 
        'data': [['uid1', 'invalid'],['uid2', 'password'],['uid3', None],['uidx',None]]}
members_up = {'format': 'member', 'version': [1, 0],
        'fields': ['uuid', 'status', 'verified', 'department','register'], 
        'data': [['uid1', 'member', False, 3, False],
            ['uid2', 'eligible', True, 2, True],
            ['uid3', 'eligible', True, 4, None],
            ['uidx', 'deleted', None, None, None] ],
    }
members_upname = {'format': 'member', 'version': [1, 0],
        'fields': ['uuid', 'status', 'verified', 'department','register'], 
        'data': [['uid1', 'member', False, 'sub', False],
            ['uid2', 'eligible', True, 'subsub', True],
            ['uid3', 'eligible', True, 'sub2', None],
            ['uidx', 'deleted', None, None, None] ],
    }

emails_sync = """member,1.0
uuid,email
uid1,bar@localhost
uid2,fnord@localhost
uid3,verify@localhost
"""
invitations_sync = """member,1.0
uuid,email
uid4,other@localhost
"""

def test_sync(member_db):
    db = member_db
    input = StringIO(json.dumps(members_down))
    memfile, depfile, inv, emails = StringIO(), StringIO(), StringIO(), StringIO()
    db.sync_members(input=input,output=[memfile,depfile,emails],invitations=inv,format='csv')

    q = db.session.query(db.Member)
    assert q.get('uid2').registered and not q.get('uid1').registered
    assert inv.getvalue()==invitations_sync
    assert emails.getvalue()==emails_sync
    members = json.loads(memfile.getvalue())
    deps = json.loads(depfile.getvalue())
    assert members == members_up
    assert deps == deps_dict

def test_push(member_db):
    db = member_db
    down = copy.deepcopy(members_down)
    down['data'] = down['data'][:2]
    input = StringIO(json.dumps(down))
    memfile, depfile = StringIO(), StringIO()
    output=[memfile,depfile]
    msg = dict(format='member',version=(1,0),status='',uuid='uid2')
    for status in ('registered','failed','new'):
        msg['status'] = status
        assert not db.process_update(msg,input,output)
        assert not memfile.getvalue()
    msg['status'] = 'registering'
    assert db.process_update(msg,input,output)
    members = json.loads(memfile.getvalue())
    assert members
    q = db.session.query(db.Member)
    assert q.get('uid2').registered and not q.get('uid1').registered
    up = copy.deepcopy(members_up)
    up['data'] = up['data'][:2]
    assert members == up
    assert not db.process_update(msg,input,output)

@yield_fixture(params=[MyMemberDatabase,MyMemberInvDatabase],scope='module')
def crypto_db(dbconnection,request):
    dbtype = request.param
    apiconfig = dict(format='json',encrypt=True,sign=True,receiver=receiver)
    extra = dict(apiconfig=apiconfig) if dbtype==MyMemberDatabase else dict(memberconfig=apiconfig)
    db = setup_db(dbtype,depspec='number',engine=dbconnection,**extra)
    db.session.commit = db.session.flush
    deps = gen_departments(db,'number')
    members = gen_members(db,deps)
    db.session.add_all(list(deps.values())+list(members))
    yield db
    stop_db(db,dbconnection)

def test_sync_crypto(bilateral,crypto_db):
    from ekklesia.data import json_encrypt, json_decrypt
    db = crypto_db
    id2 = bilateral['id2']
    input, result = json_encrypt(members_down,id2,[sender],True)
    assert result.ok
    input = StringIO(json.dumps(input))
    memfile, depfile, emails = StringIO(), StringIO(), StringIO()
    db.gpg = bilateral['id1']
    db.sync_members(input=input,output=[memfile,depfile,emails],format='csv')
    q = db.session.query(db.Member)
    assert q.get('uid2').registered and not q.get('uid1').registered

    members = memfile.getvalue()
    members, encrypted, signed, result = json_decrypt(json.loads(members),id2)
    assert result.ok and result.valid
    assert members==members_up

    deps = depfile.getvalue()
    deps, encrypted, signed, result = json_decrypt(json.loads(deps),id2)
    assert result.ok and result.valid
    assert deps==deps_dict

    result = id2.decrypt_str(emails.getvalue())
    assert result.ok and result.valid
    emails = str(result)
    assert emails==emails_sync
    db.session.rollback()

def test_empty(empty_db):
    db = empty_db
    assert not db.session.query(db.Member).count()