#!/bin/sh

chmod +x ./keyd.sh
./Keyd.sh
stow '*/'
rm README.md
mv ~/dotfiles ~/Dotfiles
