{ pkgs }:
let
  plugins = import ./plugins { inherit pkgs; };
in
{
  obsidian-plugins = plugins;
}
