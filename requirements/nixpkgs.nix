let
	pkgUrl = "https://d3g5gsiof5omrk.cloudfront.net/nixos/17.09/nixos-17.09.1997.1a8a95e879/nixexprs.tar.xz";
in
	import ( builtins.fetchTarball pkgUrl ) {}
