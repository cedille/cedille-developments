# Installing Cedille

Cedille version 1.1.1 must be installed.
There are three ways to accomplish this: either by building from source, installing the debian package, or using the MacOS App (see https://github.com/cedille/cedille/releases/tag/v1.1.1 for downloads).
More detailed instructions for each approach are documented below.

## Debian Package

The debian package `cedille-deb-pkg.deb` can be installed by downloading and double clicking it.
After it is installed, add `(require 'cedille-mode)` to your `~/.emacs` file.

## MacOS App Bundle
The macos dmg `cedille-macos-pkg.dmg` can be installed by downloading, double clicking, and moving the Cedille app to an appropriate location on your machine.
The Cedille App will automatically try to open a new instance of Emacs loaded with `cedille-mode` and the appropriate paths to the `cedille` binary.
However, it is not signed so you need to open it via `Right-Click > Open` to add an exception for it in Gatekeeper.

The Cedille App will ask you to add exceptions for the `cedille` and `cedille-core` binary after you have successfully launched it.
You must grant these exceptions for `cedille-mode` to work.


## Building From Source
The git repository can be cloned but it is recommend that the source package `cedille-src-pkg.zip` be downloaded and used instead.
The following instructions assume a fresh Ubuntu 19.04 instance:
1. First, make sure your locale is set correctly (`localectl set-locale LANG="en_US.UTF-8"`). As long as it is a `UTF-8` locale it will work. A reboot is required for this to fully take effect.
2. Make sure you have GHC installed (`sudo apt install ghc`) (version 8.4.4 was used in testing)
3. Make sure you have Cabal installed (`sudo apt install cabal-install`)
4. Make sure binaries installed with Cabal are in your `PATH` (`export PATH=$PATH:~/.cabal/bin` in `.bashrc` or equivalent for your shell)
5. Update Cabal (`cabal update`)
5. Install alex (`cabal install alex`) (version 3.2.5 was used in testing)
6. Install happy (`cabal install happy`) (version 1.19.12 was used in testing)
7. Install IEEE754 Library (`cabal install --lib ieee754`)
   1. This dependency may already be installed, but may not be if you are building on a different version of Linux (from what we have tested) or on MacOS
   2. The library, specifically, is what is needed (hence `--lib`). If you attempt to install as an executable (`cabal install ieee654`) Cabal will mention that you probably wanted to use `--lib` as there are no executables
8. Install Agda (`cabal install Agda`) (version 2.6.0.1 was used in testing)
   1. You might be missing libraries needed to build Agda (e.g. zlib `sudo apt install zlib1g-dev`) make sure to install any missing libraries until the build goes through
   2. You **should not** install Agda via the debian package as this will not include files needed for building binaries with Agda
9. In the `cedille-src-pkg` directory run `make`
10. Add the following to your `~/.emacs` file:
```
(setq cedille-path "/path/to/cedille-src-pkg/")
(add-to-list 'load-path cedille-path)
(require 'cedille-mode)
```

# Type Checking Files

Files can only be checked using Emacs. With Emacs open any of the `.ced` files and type "Meta-s" where "Meta" is typically the Alt key on Linux and the Option key on MacOS.
