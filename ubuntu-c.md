
for user in ansible root; do
  for os in ubuntu centos; do
    for instance in 1 2 3; do
      sshpass -f password.txt ssh-copy-id -o StrictHostKeyChecking=no ${user}@${os}${instance}
    done
  done
done

after this, ssh equivaliency worked, so I did docker compose down and up again due to host windows updates.

---
It looks like you're still encountering SSH host key verification issues even after removing the old entries from your `known_hosts` file. Here's how to completely resolve this:

### Complete Solution:

1. **First, completely wipe all conflicting SSH known hosts entries**:
```bash
# Remove ALL entries (be careful with this)
> /home/ansible/.ssh/known_hosts
```

2. **Configure Ansible to skip host key checking** (temporarily for setup):
```bash
export ANSIBLE_HOST_KEY_CHECKING=False
```

3. **Run your Ansible ping test again**:
```bash
ansible -i,ubuntu1,ubuntu2,ubuntu3,centos1,centos2,centos3 all -m ping
```

4. **For persistent solution, add to ansible.cfg**:
```bash
echo -e "[defaults]\nhost_key_checking = False" >> ~/ansible.cfg
```

### Why This Works:

1. The complete wipe of `known_hosts` ensures no old references remain
2. Disabling host key checking lets Ansible proceed without verification
3. New host keys will be automatically added during first connection

### Alternative (More Secure) Approach:

If you want to maintain host key verification but handle the container recreation:

1. **Preserve host keys between container recreations** by mounting them as volumes in docker-compose.yml:
```yaml
services:
  ubuntu2:
    volumes:
      - ./ssh_host_keys/ubuntu2:/etc/ssh/ssh_host_ecdsa_key
      - ./ssh_host_keys/ubuntu2.pub:/etc/ssh/ssh_host_ecdsa_key.pub
```

2. **Or use static IPs** in your docker-compose to prevent IP changes:
```yaml
networks:
  default:
    ipam:
      config:
        - subnet: 172.18.0.0/16
          gateway: 172.18.0.1
services:
  ubuntu2:
    networks:
      default:
        ipv4_address: 172.18.0.6
```

### Verification:

After applying the solution, manually SSH to one host to verify:
```bash
ssh ansible@ubuntu2
```
You should be prompted to accept the host key just once, and subsequent connections should work without prompts.
---

ansible@ubuntu-c:~$ ls
ansible.cfg  diveintoansible  password.txt
ansible@ubuntu-c:~$ vi ansible.cfg 
ansible@ubuntu-c:~$ cd diveintoansible/
ansible@ubuntu-c:~/diveintoansible$ ls
'Ansible Architecture and Design'  'Ansible Playbooks, Introduction'   DiveIntoAnsible_Cover.png  'Structuring Ansible Playbooks'
'Ansible Playbooks, Deep Dive'     'Creating Modules and Plugins'      README.md                  'Using Ansible with Cloud Services and Containers'
ansible@ubuntu-c:~/diveintoansible$ ansible --version
ansible [core 2.17.4]
  config file = None
  configured module search path = ['/home/ansible/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/ansible/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.12 (main, Jul 29 2024, 16:56:48) [GCC 11.4.0] (/usr/bin/python3)
  jinja version = 3.1.4
  libyaml = True


---
ansible@ubuntu-c:~/diveintoansible$ su -
Password: 
root@ubuntu-c:~# mkdir /etc/ansible
root@ubuntu-c:~# touch /etc/ansible/ansible.cfg
root@ubuntu-c:~# exit
logout

ansible@ubuntu-c:~/diveintoansible$ ansible --version
ansible [core 2.17.4]
  config file = /etc/ansible/ansible.cfg
  configured module search path = ['/home/ansible/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/ansible/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.12 (main, Jul 29 2024, 16:56:48) [GCC 11.4.0] (/usr/bin/python3)
  jinja version = 3.1.4
  libyaml = True

  ansible@ubuntu-c:~/diveintoansible$ cd ~
ansible@ubuntu-c:~$ pwd
/home/ansible

ansible@ubuntu-c:~$ touch .ansible.cfg
ansible@ubuntu-c:~$ ansible --version
ansible [core 2.17.4]
  config file = /home/ansible/ansible.cfg
  configured module search path = ['/home/ansible/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/ansible/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.12 (main, Jul 29 2024, 16:56:48) [GCC 11.4.0] (/usr/bin/python3)
  jinja version = 3.1.4
  libyaml = True

  ansible@ubuntu-c:~$ cd /tmp
ansible@ubuntu-c:/tmp$ ansible --version
ansible [core 2.17.4]
  config file = /home/ansible/.ansible.cfg
  configured module search path = ['/home/ansible/.ansible/plugins/modules', '/usr/share/ansible/plugins/modules']
  ansible python module location = /usr/local/lib/python3.10/dist-packages/ansible
  ansible collection location = /home/ansible/.ansible/collections:/usr/share/ansible/collections
  executable location = /usr/local/bin/ansible
  python version = 3.10.12 (main, Jul 29 2024, 16:56:48) [GCC 11.4.0] (/usr/bin/python3)
  jinja version = 3.1.4
  libyaml = True


ansible@ubuntu-c:/tmp$ cd
ansible@ubuntu-c:~$ pwd
/home/ansible

