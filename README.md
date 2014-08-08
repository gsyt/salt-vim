Ted Cook's .vimrc
=================

Personal vimrc configuration file

One-Step Install
----------------
* Using curl:
```
	curl -o - https://raw.github.com/teddyphreak/vim-vimrc/master/install.sh | sh
```

* Using wget:
```
	wget -O - https://raw.github.com/teddyphreak/vim-vimrc/master/install.sh | sh
```

Manual Install:
---------------
1. Install NeoBundle
```
	mkdir -p ~/.vim/bundle
	git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
```
2. Check out from github
```
	git clone git@github.com:teddyphreak/vim-vimrc.git ~/.vim
	cd ~/.vim
```

Notable Plugins:
----------------

* [NeoBundle](https://github.com/Shougo/neobundle.vim) Vim package manager
