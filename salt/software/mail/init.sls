mail-packages:
  pkg.installed:
  - pkgs:
     - sendmail-cf
     - mailx

/etc/mail/sendmail.mc-masquerade:
  file.replace:
    - name: /etc/mail/sendmail.mc
    - pattern: ^.*MASQUERADE_AS.*$
    - repl: MASQUERADE_AS(`brainard-archiva-test.psych.upenn.edu')dnl

/etc/mail/sendmail.mc-masquerade-env:
  file.replace:
    - name: /etc/mail/sendmail.mc
    - pattern: ^.*FEATURE\(masquerade_envelope\).*$
    - repl: FEATURE(masquerade_envelope)dnl

/etc/mail/sendmail.mc-masquerade-entiredomain:
  file.replace:
    - name: /etc/mail/sendmail.mc
    - pattern: ^.*FEATURE\(masquerade_entire_domain\).*$
    - repl: FEATURE(masquerade_entire_domain)dnl

/etc/mail/sendmail.mc-masquerade-localhost:
  file.replace:
    - name: /etc/mail/sendmail.mc
    - pattern: ^.*MASQUERADE_DOMAIN\(localhost\).*$
    - repl: MASQUERADE_DOMAIN(localhost)

/etc/mail/sendmail.mc-masquerade-localhostlocaldomain:
  file.replace:
    - name: /etc/mail/sendmail.mc
    - pattern: ^.*MASQUERADE_DOMAIN\(localhost.localdomain\).*$
    - repl: MASQUERADE_DOMAIN(localhost.localdomain)

/etc/mail/sendmail.mc-masquerade-amazonaws:
  file.line:
    - name: /etc/mail/sendmail.mc
    - after: MASQUERADE_DOMAIN\(localhost.localdomain\)
    - content: MASQUERADE_DOMAIN(amazonaws.com)
    - mode: ensure

sendmail-service:
  service.running:
  - name: sendmail
  - enable: true
  - watch:
    - file: /etc/mail/sendmail.mc
