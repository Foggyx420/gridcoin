
Debian
====================
This directory contains files used to package gridcoind/gridcoin-qt
for Debian-based Linux systems. If you compile gridcoind/gridcoin-qt yourself, there are some useful files here.

## gridcoin: URI support ##


gridcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install gridcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your gridcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/gridcoin128.png` to `/usr/share/pixmaps`

gridcoin-qt.protocol (KDE)

