{ pkgs ? import <nixpkgs-25.05> {} }:

with pkgs;

mkShell {
  buildInputs = [
    jdk
    (androidenv {
      buildTools = [ "30.0.3" ];
      platforms  = [ "android-30" ];
      extraTools = [
        gradle
        androidenv.androidPkgs.tools
        androidenv.androidPkgs.platform-tools
      ];
    })
  ];
}