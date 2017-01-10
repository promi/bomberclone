#!/bin/sh

# to use this please read http://www.libsdl.org/extras/win32/cross/README.txt
# from there i have got all this.



PREFIX=/usr/local/cross-tools
TARGET=i386-mingw32msvc
PATH="$PREFIX/bin:$PREFIX/$TARGET/bin:$PATH"
export PATH

cache=cross-config.cache

sh configure LDFLAGS=../bc-res.o --cache-file="$cache" --disable-debug \
	--target=$TARGET --host=$TARGET --build=i386-linux \
	$*

make $*

# create the executeable with a icon ressource..

