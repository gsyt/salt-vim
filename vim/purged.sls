{% from "vim/map.jinja" import vim with context %}

{% set package = {
  'name': vim.package,
  'upgrade': salt['pillar.get']('vim:package:upgrade', False),
} %}

{% set config = {
  'manage': salt['pillar.get']('vim:config:manage', False),
  'neobundle': salt['pillar.get']('vim:config:neobundle', True),
  'users': salt['pillar.get']('vim:config:users', []),
  'source': salt['pillar.get']('vim:config:source', 'salt://vim/conf/.vimrc'),
} %}

vim.purged:
  pkg.purged:
    - name: {{ package }}
{% if config.manage %}
  {% if config.users %}
  require:
    {% for user in config.users %}
    - sls: vimrc-{{ user }}.purged
    {% endfor %}
  {% endif %}
{% endif %}

{% if config.manage %}
  {% if config.users %}
    {% for user in config.users %}
      {% set userhome = salt['user.info'](user).home %}
vimrc-{{ user }}.purged:
  file.absent:
    - name: {{ userhome }}/.vimrc
  require:
    - sls: neobundle-{{ user }}.purged

neobundle-{{ user }}.purged:
  file.absent:
    - name: {{ userhome }}/.vim/bundle/neobundle.vim
    {% endfor %}
  {% endif %}
{% endif %}
