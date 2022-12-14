{ sources ? import ./nix/sources.nix
, pkgs ? import sources.nixpkgs { }
}:

with pkgs;

stdenv.mkDerivation {
  name = "mydoc";
  buildInputs = [
    (texlive.combine {
      inherit (texlive)
        scheme-small

        # Add other LaTeX libraries (packages) here as needed, e.g:
        sourcesanspro
        moresize
        anyfontsize
        csquotes
        enumitem
        titlesec
        standalone
        currfile
        gincltex
        svn-prov
        adjustbox
        collectbox
        filemod
        blindtext
        ly1

        # build tools
        latexmk
        ;
    })
    glibcLocales
  ];
  src = ./.;
  buildPhase = "make";

  meta = with lib;
    {
      description = "Describe your document here";
      license = licenses.bsd3;
      platforms = platforms.linux;
    };
}
