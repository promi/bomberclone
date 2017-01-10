#!/bin/sh

PREFIX=/usr/local/cross-tools
TARGET=i386-mingw32msvc
PATH="$PREFIX/bin:$PREFIX/$TARGET/bin:$PATH"
export PATH
cache=cross-config.cache
sh configure --cache-file="$cache" \
	--target=$TARGET --host=$TARGET --build=i386-linux \
	$*
status=$?
exit $status
