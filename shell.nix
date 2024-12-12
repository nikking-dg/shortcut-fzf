{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
  buildInputs = with pkgs; [
    jq
    fzf
    bat
    websocat
    aichat
    delta
    ffmpeg_6-full
  ];
}
