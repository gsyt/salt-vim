include:
  - git.installed

{% from "vim/map.jinja" import vim with context %}

{% set package = {
  'upgrade': salt['pillar.get']('vim:package:upgrade', False),
} %}

{%- set config = {
  'manage': salt['pillar.get']('vim:config:manage', False),
  'neobundle': salt['pillar.get']('vim:config:neobundle', True),
  'users': salt['pillar.get']('vim:config:users', []),
  'source': salt['pillar.get']('vim:config:source', 'salt://vim/conf/.vimrc'),
} %}

vim.installed:
  pkg.{{ 'latest' if package.upgrade else 'installed' }}:
    - name: {{ vim.package }}
{% if config.manage %}
  {% if config.users %}
  require:
    {% for user in config.users %}
    - sls: vimrc-{{ user }}
    - sls: vimconfig-{{ user }}
    {% endfor %}
  {% endif %}
{% endif %}

{% if config.manage %} 
  {% for user in config.users %}
    {% set userhome = salt['user.info'](user).home %}
vimconfig-{{ user }}:
  file.append:
    - name: {{ userhome }}/.bashrc
    - text: alias vi='vim'

vimrc-{{ user }}:
  file.managed:
    - name: {{ userhome }}/.vimrc
    - source: {{ config.source }}
    - user: {{ user }}
  require:
    - sls: neobundle-{{ user }}

    {% if config.neobundle %}
neobundle-{{ user }}:
  git.latest:
    - name: https://github.com/Shougo/neobundle.vim
    - target: {{ userhome }}/.vim/bundle/neobundle.vim
    - user: {{ user }}
  require:
    - sls: git
    {% endif %}
  {% endfor %}
{% endif %}
