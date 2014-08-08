include:
  - git

{% set os = salt['grains.get']('os') %}
{% set users = salt['pillar.get']('vim:users', []) %}
{% set pkgdefault = { 
  'Ubuntu': 'vim-nox', 
  'RedHat': 'vim-enhanced' } %}
{% set pkgname = salt['pillar.get']('vim:pkg:' ~ os, pkgdefault[os]) %}

vim.installed:
  pkg.latest:
    - name: {{ pkgname }}
  require:
    - git
  {% if users %}
    {% for user in users %}
    - sls: vimrc-{{ user }}
    - sls: vimconfig-{{ user }}
    {% endfor %}
  {% endif %}

{% for user in users %}
  {% set userhome = salt['user.info'](user).home %}
vimconfig-{{ user }}:
  file.append:
    - name: {{ userhome }}/.bashrc
    - text: alias vi='vim'

vimrc-{{ user }}:
  file.managed:
    - name: {{ userhome }}/.vimrc
    - user: {{ user }}
  require:
    - sls: neobundle-{{ user }}

neobundle-{{ user }}:
  git.latest:
    - name: https://github.com/Shougo/neobundle.vim
    - target: {{ userhome }}/.vim/bundle/neobundle.vim
    - user: {{ user }}
{% endfor %}
