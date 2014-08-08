{% 
set users = pillar.get('vim:users', {}).items() 
set pkgdefault == { 
  'Ubuntu': 'vim-nox', 
  'RedHat': 'vim-enhanced' }
endif %}

vim:
  pkg.latest:
    - name: salt['pillar.get']('vim:pkg:name', {{ pkgdefault[grains['os']] }})
  require:
    {% for user in users %}
      - vimrc-{{ user }}
      - neobundle-{{ user }}
    {% endfor %}

{% for user in users %}
  {% set userhome = salt['user.info'](user).home %}
  {% if salt['file.exists')(userhome) %}
vimrc-{{ user }}:
  file.managed:
    - name: {{ userhome }}/.vimrc
    - source: salt://vim/vimrc/.vimrc
    - require:
      pkg: vim
      sls: neobundle-user

bundle-{{ user }}:
  file.directory:
    - name: {{ userhome }}/.vim/bundle

neobundle-{{ user }}:
  require:
    - bundle-{{ user }}
  git.latest:
    - name: https://github.com/Shougo/neobundle.vim
    - target: {{ userhome }}/.vim/bundle/neobundle.vim
  {% endif %}
{% endfor %}

