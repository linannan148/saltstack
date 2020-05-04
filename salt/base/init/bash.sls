/etc/bashrc:
  file.managed:
    - source: salt://init/files/bashrc
    - user: root
    - group: root
    - mode: 644