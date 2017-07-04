let
	pkgUrl = "https://d3g5gsiof5omrk.cloudfront.net/nixpkgs/nixpkgs-17.09pre110215.7d36ae33df/nixexprs.tar.xz";
in
	import ( builtins.fetchTarball pkgUrl ) {}
