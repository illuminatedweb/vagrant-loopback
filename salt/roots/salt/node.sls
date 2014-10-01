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
    - name: "npm install -g strongloop && npm install -g gulp && npm install -g bower"
    - require:
      - pkg: nodejs
      - pkg: git

bowerinstall:
  cmd.run:
    - name: "bower install --allow-root --no"
    - cwd: /vagrant/app
    - require:
      - cmd: globalnpm
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
