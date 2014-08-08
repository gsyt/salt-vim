{% set os = salt['grains.get']('os') %}
{% set users = salt['pillar.get']('vim:users', []) %}
{% set pkgdefault = { 
  'Ubuntu': 'vim-nox', 
  'RedHat': 'vim-enhanced' } %}
{% set pkgname = salt['pillar.get']('vim:pkg:' ~ os, pkgdefault[os]) %}

vim.purged:
  pkg.purged:
    - name: {{ pkgname }}
  {% if users %}
  require:
    {% for user in users %}
    - sls: vimrc-{{ user }}
    {% endfor %}
  {% endif %}

{% for user in users %}
  {% set userhome = salt['user.info'](user).home %}
vimrc-{{ user }}:
  file.absent:
    - name: {{ userhome }}/.vimrc
  require:
    - sls: neobundle-{{ user }}

neobundle-{{ user }}:
  file.absent:
    - name: {{ userhome }}/.vim/bundle/neobundle.vim
{% endfor %}
