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