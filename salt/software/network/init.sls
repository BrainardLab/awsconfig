system:
  network.system:
  - enabled: True
  - hostname: brainard-archiva-test.psych.upenn.edu
  - nozeroconf: True

eth0:
  network.managed:
  - enabled: true
  - type: eth
  - proto: dhcp
  - device: eth0
  - userctl: yes
  - peerdns: yes
  - dhcpv6c: yes
  - dhcpv6c_options: -nw
  - persistent_dhclient: yes
  - res_options: "timeout:2 attempts:5"
  - dhcp_arp_check: no
