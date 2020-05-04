nginx-install:
  pkg:
    - name: nginx
    - installed
  service:
    - running
    - name: nginx
    - enable: True
    - reload: True
    - watch:
      - pkg: nginx
      - file: /etc/nginx/nginx.conf

/etc/nginx/nginx.conf:
  file:
    - managed
    - source: salt://nginx/files/nginx.conf
    - user: root
    - group: root
    - mode: 755