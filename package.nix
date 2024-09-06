{ 
  lib,
  stdenv,
  glibc,
}:

stdenv.mkDerivation {
  pname = "tmalign";
  version = "20220412";

  src = ./.;

  buildInputs = [ glibc.static ];

  buildPhase = ''
  g++ -static -O3 -ffast-math -lm -o TMalign TMalign.cpp
  '';

  installPhase = ''
  mkdir -p $out/bin
  cp TMalign $out/bin
  '';

  meta = with lib; {
    description = "TM-align is an algorithm for sequence independent protein structure comparisons.";
    homepage = "https://seq2fun.dcmb.med.umich.edu//TM-align/";
    license = licenses.mit;
  };
}
