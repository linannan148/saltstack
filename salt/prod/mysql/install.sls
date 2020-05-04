mysql-yum-source:
  cmd:
    - run
    - names:
      - wget https://dev.mysql.com/get/mysql80-community-release-el7-3.noarch.rpm
      - yum localinstall mysql80-community-release-el7-3.noarch.rpm

mysql-install:
  pkg:
    - name: mysql-community-server
    - installed
  service:
    - running
    - name: mysqld
    - enable: True
    - reload: True
    - watch:
      - pkg: mysql-community-server
      - file: /etc/my.cnf

/etc/my.cnf:
  file:
    - managed
    - source: salt://mysql/files/my.cnf
    - user: root
    - group: root
    - mode: 644