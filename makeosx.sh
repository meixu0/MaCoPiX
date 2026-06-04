#!/bin/sh
touch configure configure.ac aclocal.m4 Makefile.am Makefile.in
export CFLAGS="-I/opt/homebrew/include"
export PKG_CONFIG_PATH="/opt/homebrew/opt/libffi/lib/pkgconfig:/opt/homebrew/opt/openssl/lib/pkgconfig:/opt/homebrew/lib/pkgconfig"
./configure --with-gtkmac \
        --disable-dependency-tracking \
        --with-localedir="Contents/Resources/share/locale" \
        --with-themedir="Contents/Resources/share/icons"
find . -name "Makefile" -exec sed -i '' 's/-c -o/-x objective-c -c -o/g' {} +
make clean
make