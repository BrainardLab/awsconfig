/usr/local/src/apache-archiva-2.2.3-bin.tar.gz:
  file.managed:
  - source: http://supergsego.com/apache/archiva/2.2.3/binaries/apache-archiva-2.2.3-bin.tar.gz
  - source_hash: http://www.apache.org/dist/archiva/2.2.3/binaries/apache-archiva-2.2.3-bin.tar.gz.md5

/opt/apache-archiva-2.2.3:
  cmd.run:
  - name: tar -xf /usr/local/src/apache-archiva-2.2.3-bin.tar.gz -C /opt
  - creates: /opt/apache-archiva-2.2.3/NOTICE

/etc/default/archiva:
  file.managed:
  - source: salt://files/etc/default/archiva
  - user: root
  - group: root
  - mode: 755

patch:
  pkg.installed

mysql-server:
  pkg.installed

mysql-connector-java.noarch:
  pkg.installed

java-1.8.0-openjdk:
  pkg.installed

MySQL-python27:
  pkg.installed

mysqld:
  service.running:
  - enable: true

archiva-mysql:
  mysql_user.present:
  - name: sa
  - host: localhost
  - password: archivauserpassword

archiva-db:
  mysql_grants.present:
  - database: archiva.*
  - grant: all privileges
  - user: sa

archiva-db-schema:
  cmd.run:
  - name: mysql -e "create database archiva"; mysql archiva < /usr/local/awsconfig/salt/files/archiva.sql
  - unless: mysql --batch -e 'show databases;' | grep archiva

/opt/apache-archiva-2.2.3/bin/archiva:
  file.patch:
  - source: salt://files/archiva.patch
  - hash: 487965b38d100d48255a6280ed7285ec

/etc/init.d/archiva:
  file.symlink:
  - target: /opt/apache-archiva-2.2.3/bin/archiva

archiva-group:
  group.present:
  - name: archiva

archiva-user:
  user.present:
  - name: archiva
  - gid: archiva
  - createhome: true
  - home: /var/archiva
  - fullname: archiva account

{% for d in ['logs', 'temp'] %}
/var/archiva/{{ d }}:
  file.directory:
  - user: archiva
  - group: archiva
  - mode: 755
{% endfor %}

{% for file in [ 'archiva.xml', 'security.properties' ] %}
/var/archiva/conf/{{ file }}:
  file.managed:
  - source: salt://files/var/archiva/conf/{{ file }}.jinja
  - user: archiva
  - group: archiva
  - mode: 640
  - makedirs: true
  - template: jinja
  - context: 
      fqdn: {{ salt['grains.get']('fqdn', '') }}

{% endfor %}

{% for file in [ 'archiva-cassandra.properties', 'jetty.xml', 'shared.xml', 'wrapper.conf'] %}

/var/archiva/conf/{{ file }}:
  file.managed:
  - source: salt://files/var/archiva/conf/{{ file }}
  - user: archiva
  - group: archiva
  - mode: 640
  - makedirs: true
{% endfor %}
