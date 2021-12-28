cp ansible.cfg.example ansible.cfg && \
cp hosts.yml.example hosts.yml && \
cp vars/tyk.yml.example vars/tyk.yml && \
ansible-galaxy install -r requirements.yml
