let
	pkgUrl = "https://d3g5gsiof5omrk.cloudfront.net/nixos/17.09/nixos-17.09.1535.1fdca25ee8/nixexprs.tar.xz";
in
	import ( builtins.fetchTarball pkgUrl ) {}
