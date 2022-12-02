#!/usr/bin/env bash

if [[ ! -d "$HOME/.emacs.d" ]]; then
    echo "You need to get Doom Emacs installed first, see: https://github.com/doomemacs/doomemacs#install"
    exit 1
fi

echo "==> Linking Doom configuration ..."
self=`realpath $0`
ln -s `dirname $self` $HOME/.doom.d

echo "==> Applying doom-colemak.patch ..."
pushd $HOME/.emacs.d
git apply "$(dirname $self)/doom-colemak.patch" && echo "==> Done!"
popd
