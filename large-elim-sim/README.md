# Installing Cedille

Cedille version 1.1.2 must be installed.
There are three ways to accomplish this: either by building from source, installing the debian package (recommended), or using the MacOS App (see https://github.com/cedille/cedille/releases/tag/v1.1.2 for downloads).
More detailed instructions for each approach are documented below.

## Debian Package

The debian package `cedille-deb-pkg.deb` can be installed by downloading and double-clicking it.
After it is installed, add `(require 'cedille-mode)` to your `~/.emacs` file.

## MacOS App Bundle
The macos dmg `cedille-macos-pkg.dmg` can be installed by downloading, double-clicking, and moving the Cedille app to an appropriate location on your machine.
The Cedille App will automatically try to open a new instance of Emacs loaded with `cedille-mode` and the appropriate paths to the `cedille` binary.
However, it is not signed so you need to open it via `Right-Click > Open` to add an exception for it in Gatekeeper.

The Cedille App will ask you to add exceptions for the `cedille` and `cedille-core` binary after you have successfully launched it.
You must grant these exceptions for `cedille-mode` to work.


## Building From Source
The git repository can be cloned, but it is recommended that the source package `cedille-src-pkg.zip` be downloaded and used instead.

1. Install C libraries *zlib** and *ncurses** for building Agda
    - `apt install zlib1g-dev libncurses5-dev` on Ubuntu for example
    - On MacOS these may already be available if you have xcode libraries installed
2. In the `cedille-src-pkg` directory:
    - Run `stack build Agda alex happy`
    - Run `stack build --copy-bins --local-bin-path .`
3. Add the following to your `~/.emacs` file, changing the path to match your system
```
(setq cedille-path "/path/to/cedille-src-pkg/")
(add-to-list 'load-path cedille-path)
(require 'cedille-mode)
```

# Type Checking Files

Files can only be checked using Emacs. With Emacs open any of the `.ced` files and type "Meta-s" where "Meta" is typically the Alt key on Linux and the Option key on MacOS.
