Development Tools:
  pkg.group_installed

openssl:
  pkg.installed

openssl-devel:
  pkg.installed

/usr/local/src/git-crypt:
  cmd.run:
    - name: cd /usr/local/src; git clone https://www.agwa.name/git/git-crypt.git
    - unless: test -d /usr/local/src/git-crypt

installGitCrypt:
  cmd.run:
    - name: cd /usr/local/src/git-crypt; make; make install
    - unless: which git-crypt
