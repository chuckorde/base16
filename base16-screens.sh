#!/usr/bin/env

echo "# Base16 colorschemes in nvim" > README.md

kitty -o window_padding_width=0 nvr &
sleep 3

nvr --remote-send ":edit examples/example.ts<cr>"
nvr --remote-send ":split examples/example.py<cr>"
nvr --remote-send ":vsplit examples/example.c<cr>"
nvr --remote-send "<C-w>j"
nvr --remote-send ":vsplit examples/example.nix<cr>"

sleep 3

for scheme in $( ls -1 ~/code/base16/base16-shell/scripts ); do
  nvr --remote-send ":colorscheme ${scheme/\.sh/}<cr>"
  sleep 1
  hyprshot -m window -c -f ${scheme}.png -o images/
  echo "## ${scheme}" >> README.md
  echo "![alt text](images/${scheme}.png)" >> README.md
done

nvr --remote-send ":qall<cr>"
