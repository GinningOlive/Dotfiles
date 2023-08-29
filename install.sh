#!/bin/sh

chmod +x ./keyd.sh
./Keyd.sh
stow '*/'
mv ~/dotfiles ~/Dotfiles
