#!/bin/sh

chmod +x ./keyd.sh
./Keyd.sh
stow '*/'
rm readme.md
mv ~/dotfiles ~/Dotfiles
