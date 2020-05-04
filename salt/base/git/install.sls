git:
  pkg.installed:
    - require_in:
      - file: /etc/gitconfig

/etc/gitconfig:
  file.managed:
    - source: salt://git/files/gitconfig
    - user: root
    - group: root
    - mode: 755