## dotfiles

These are my system config files.

I'm using [GNU Stow](https://www.gnu.org/software/stow/) to manage everything.

If you want dotfiles in version control, use it, seriously.

The way it works is - make any number of packages, where each one is a
directory.  Inside each directory, mimic the desired structure of your files as
if the directory were `~/`.  There's no stow config or anything necessary.

Run `$ stow mypackage` to install everything in `mypackage/`.  Stow will
intelligently create symlinks to all those files while not overwriting anything
it doesn't control.  For instance, my `~/.config/` has a bunch of crap I don't
care about, and some stuff I do.  This lets me keep the important stuff in
version control while leaving everything else alone.
