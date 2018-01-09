
haproxy:
  pkg.installed

/etc/haproxy/haproxy.cfg:
  file.managed:
  - source: salt://files/etc/haproxy/haproxy.cfg
  - user: root
  - group: root
  - mode: 644

haproxy-service:
  service.running:
  - name: haproxy
  - enable: true
  - watch:
    - file: /etc/haproxy/haproxy.cfg
