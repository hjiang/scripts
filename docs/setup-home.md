`setup-home` sets up a family environment for me on a new Unix-like machine.

It does the following:

- Check if Homebrew is installed. If not, install it.
- Check if `~/.config` is a git repo. If not, clone `https://github.com/hjiang/dotconfig` into it. The original files in `~/.config` is preserved. Unless the same file is also in the git repo, in which case it is overwritten.
- Symlink `~/.zshrc` to `~/.config/zsh/config.zsh`.
- Install zsh from Homebrew and make it the default shell for the current user.
- Install emacs-plus from Homebrew with the `--with-modern-sexy-v2-icon` and the `--with-imagemagick` options
- Clone `https://github.com/hjiang/emacs.d` to `~/.emacs.d`

All these steps are done in an idempotent way, and if something is already done, it should not be repeated.
