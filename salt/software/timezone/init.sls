/etc/sysconfig/clock:
  file.managed:
  - content: America/New_York

/etc/localtime:
  file.symlink:
  - target: /usr/share/zoneinfo/America/New_York
  - force: true
