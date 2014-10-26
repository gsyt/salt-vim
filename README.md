salt-vim
========
Salt formula to set up and configure [VIm](http://www.vim.org/)

Parameters
------------
Please refer to example.pillar for a list of available pillar configuration options

Requirements
------------
git state is required for vim:config:manage = True

Usage
-----
- Apply state 'vim.install' to install to target minions
- State 'vim' is provided as an alias for 'vim.install'

Compatibility
-------------
Ubuntu 13.10, 14.04 and CentOS 6.x
