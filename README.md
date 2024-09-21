# Wet
Wet is a *LFS utility for manually building packages from source.

## Installation
You may install wet by running the following command as root:
```bash
curl -sSL https://raw.githubusercontent.com/Toxikuu/wet/refs/heads/main/install.sh | bash
```
If you'd rather not curl as root, simply remove the pipe and then execute the script as root.

Alternatively, you may clone this repository and then execute install.sh. The script is made to handle both cases.

## Usage
Wet wraps wget, tar, and navigation. In other words, it abstracts the source download, extraction, navigation, and cleanup steps for *LFS packages (or any other tarball really).
```bash
wet https://gitlab.com/OldManProgrammer/unix-tree/-/archive/2.1.3/unix-tree-2.1.3.tar.bz2 # or any other tarball url
# you are now in the source directory for unix-tree, with the wet environment sourced
# below are the build steps for tree
make
make PREFIX=/usr MANDIR=/dev/null install
# now that you've finished building the package, execute x
x # alias for exit, only active in the wet environment
# the source directory gets removed, and you are returned to the directory from which you ran wet
```

Wet takes one argument, a URL that wget handles.

## Edge cases
- Wet does not support zip files.
- Don't use this for your kernel, since you usually want to keep the source directory
- Don't use this for the app, font, and lib packages for X11. (It \[probably\] won't work.)

## Dependencies
Wet has runtime dependencies on wget, curl, bash, and git.
