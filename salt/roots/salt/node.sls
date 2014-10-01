git:
  pkg:
    - installed
    - names:
      - git

mysql-server:
  pkg:
    - installed

mysql:
  service:
    - running
  require:
    - pkg: mysql-server

nodejs:
  pkg:
    - installed
    - require:
       - cmd: nodejsppa

nodejsppa:
  cmd.run:
    - name: "add-apt-repository -y ppa:chris-lea/node.js && apt-get update"
    - unless: "[ -f /etc/apt/sources.list.d/chris-lea-node_js-{{ grains['oscodename'] }}.list ]"

globalnpm:
  cmd.run:
    - name: "npm install --global gulp && npm install --global strongloop"
    - require:
      - pkg: nodejs
      - pkg: git

npminstall:
  cmd.run:
    - name: "npm install"
    - cwd: /vagrant
    - require:
      - cmd: globalnpm
      - pkg: nodejs
      - pkg: git
      - pkg: mysql-server
