# Dotfiles
Inspiration from Christian Chiarulli on [GitHub](https://github.com/ChristianChiarulli/Machfiles) and [YouTube](https://youtu.be/90xMTKml9O0).

You will need `git` and GNU `stow`.

Git clone in `$HOME` directory or `~`.

```bash
git clone https://github.com/GinningOlive/Dotfiles.git ~
```

To stow everything, run 
```bash
cd ~/Dotfiles && chmod +x ./install.sh && ./install.sh
```

Otherwise, run `stow` and the name of symlink you want to make.

Example: `stow ZSH`
