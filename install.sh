#!/bin/sh

LPWD=`pwd`
VIM=vim
VIMHOME=~/.vim
NBUNDLEHOME=~/.vim/bundle/neobundle.vim
NBUNDLEGITHOME=git://github.com/Shougo/neobundle.vim

warn() {
	echo "$1" >&2;
}

die() {
	warn "$1";
	exit 1;
}

for dir in "$LOCALHOME" "$LOCALHOME/vimrc" "~/.vimrc"; do 
	if [ -e  "$dir" ]; then
		die "$dir already exists";
	fi;
done;

# Clone Vundle plugin
if [ ! -d $NBUNDLEHOME ]; then
	mkdir -p `dirname $NBUNDLEHOME`;
	git clone $NBUNDLEGITHOME $NBUNDLEHOME;
fi
# Install .vimrc
wget -O ~/.vimrc https://raw.githubusercontent.com/teddyphreak/vim-vimrc/master/.vimrc

