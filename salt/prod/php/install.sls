php-install:
  pkg:
    - installed
    - names:
      - mod_php72w
      - php72w-cli
      - php72w-fpm
      - php72w-common
      - php72w-devel
      - php72w-embedded
      - php72w-gd
      - php72w-mbstring
      - php72w-mysqlnd
      - php72w-opcache
      - php72w-pdo
      - php72w-xml
      - php72w-bcmath
      - php72w-pecl-redis
      - php72w-pecl-imagick
    - require:
      - cmd: php-yum-source
      - cmd: php-remove
  service:
    - running
    - name: php-fpm
    - enable: True
    - reload: True
    - watch:
      - pkg: php-install
      - file: /etc/php.ini

/etc/php.ini:
  file:
    - managed
    - source: salt://php/files/php.ini
    - user: root
    - mode: 755
    - group: root


php-yum-source:
  cmd:
    - run
    - name: rpm -Uvh http://mirror.webtatic.com/yum/el7/webtatic-release.rpm
    - onlyif: test 8 -ge `yum search -q php72w 2>&1 |wc -l`
php-remove:
  cmd:
    - run
    - name: yum -y remove php56w*
