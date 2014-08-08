salt-vim
========

Salt formula to set up and configure [VIm](http://www.vim.org/)

Requirements
------------
The following pillars *should* exist:
  * vim:users
  * vim:pkg:'salt['pillar.get']('os')
The following states **must** exist;
  * git

Usage
-----
Apply state 'vim.install' to install to target minions
Apply state 'vim.purge' to remove from target minions
State 'vim' is provided as an alias for 'vim.install'

Compatibility
-------------
Ubuntu 14.04 and CentOS 6.x
