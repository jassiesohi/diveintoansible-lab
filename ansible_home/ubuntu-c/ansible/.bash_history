ping google.com
sudo apt update
sudo /etc/os-release
sudo cat /etc/os-release

sudo sed -i 's|http://archive.ubuntu.com|http://us.archive.ubuntu.com|g' /etc/apt/sources.list
sudo apt update
sudo sed -i 's|http://|https://|g' /etc/apt/sources.list
sudo apt update
sudo apt install sshpass
ping ubuntu1
ssh ansible@ubuntu1
for user in ansible root; do for os in ubuntu centos; do for instance in 1 2 3; do
ssh-keygen
ls -la .ssh/
for user in ansible root; do for os in ubuntu centos; do for instance in 1 2 3; do
echo password > password.txt
for user in ansible root; do for os in ubuntu centos; do for instance in 1 2 3; do sshpass -f password.txt ssh ${user}@${os}${instance} "chmod 700 ~/.ssh; chmod 600 ~/.ssh/authorized_keys"; done; done; done
ssh ansible@ubuntu1
for user in ansible root; do for os in ubuntu centos; do for instance in 1 2 3; do sshpass -f password.txt ${user}@${os}${instance}; done; done; done
sudo apt install sshpass
for user in ansible root; do for os in ubuntu centos; do for instance in 1 2 3; do sshpass -f password.txt ssh-copy-id -o StrictHostKeyChecking=no ${user}@${os}${instance}; done; done; done
ssh ansible@ubuntu1
ssh ansible@ubuntu2
ssh ansible@ubuntu3
ssh root@ubuntu3
ssh root@ubuntu2
ssh root@ubuntu
ssh root@ubuntu1
clear
ping ubuntu1
ssh ubuntu1
ansible -i,ubuntu1,ubuntu2,ubuntu3,centos1,centos2,centos3 all -m ping 
ssh ansible@ubuntu2
ssh-keygen -R ubuntu2
ssh-keygen -R ubuntu3
ssh-keygen -R centos1
ssh-keygen -R 172.18.0.6
ssh-keygen -R 172.18.0.8
ssh-keygen -R 172.18.0.9
ansible -i,ubuntu1,ubuntu2,ubuntu3,centos1,centos2,centos3 all -m ping 
ssh ansible@ubuntu2
> /home/ansible/.ssh/known_hosts
export ANSIBLE_HOST_KEY_CHECKING=False
ansible -i,ubuntu1,ubuntu2,ubuntu3,centos1,centos2,centos3 all -m ping
echo -e "[defaults]\nhost_key_checking = False" >> ~/ansible.cfg
ansible -i,ubuntu1,ubuntu2,ubuntu3,centos1,centos2,centos3 all -m ping
got clone https://github.com/spurin/diveintoansible.git
git clone https://github.com/spurin/diveintoansible.git
ls
vi ansible.cfg 
cd diveintoansible/
ls
ansible --version
su -
ansible --version
cd ~
pwd
touch .ansible.cfg
ansible --version
cd /tmp
ansible --version
cd
pwd
mkdir testdir
cd testdir/
touch ansible.cfg
ansible --version
cd ..
ls
rm -Rf testdir/
ls
ansible --version
touch this_is_my_example_ansible.cfg
export ANSIBLE_CONFIG=/home/ansible/this_is_my_example_ansible.cfg
ansible --version
unset ANSIBLE_CONFIG
sudo rm this_is_my_example_ansible.cfg 
sudo rm /etc/ansible/
sudo rm /etc/ansible/ansible.cfg
sudo rm .ansible.cfg 
ls
ls 
ls -la
ls
cd diveintoansible/Ansible\ Architecture\ and\ Design/
ls
cd Inventories/
ls
cd 01
ls
ping centos1
ls -la
cat ansible.cfg 
cat hosts 
rm -rf /home/ansible/.ssh/known_hosts
ansible all -m ping
cd ../02
ls
cat ansible.cfg 
ansible all -m ping
rm -rf /home/ansible/.ssh/known_hosts
ls -la /home/ansible/.ssh/known_hosts
ansible all -m ping
cd ../03
ls
cat /home/ansible/ansible.cfg 
vi /home/ansible/ansible.cfg 
ls
cat ansible.cfg 
ansible all -m ping
ls
cat hosts 
ls
rm -rf /home/ansible/.ssh/known_hosts
ansible centos -m ping
ansible ubuntu -m ping
ansible * -m ping 
ansible '*' -m ping
ansible all -m ping -o
ansible centos --list-hosts
ansible ubuntu --list-hosts
ansible all --list-hosts
ansible centos1 --list-hosts -o
ansible centos1 -m ping -o
ansible ~.*3 --list-hosts
cd ../04
ls
cat ansible.cfg 
cat hosts
ansible all -m [ing -o
ansible all -m ping -o
ansible all -m command -a 'id' -o
cd ../05
ls
cat ansible.cfg 
cat hosts 
ansible all -m command -a 'id' -o
ansible all -a 'id' -o
ssh root@centos1 -p 22
ansible all -m ping -o
cd ../06
ls
cat ansible.cfg 
cat hosts
ls
cat ansible.cfg 
cat hosts 
ansible all -m ping -o
cd ../07
cat ansible.cfg 
cat hosts 
ansible all -m ping -o
cd ../08
ls
cat ansible.cfg 
cat hosts 
cd ../09
cat ansible.cfg 
cat hosts 
ansible all -m ping -o
cd ../10
ls
cat ansible.cfg 
cat hosts 
ansible all -m ping -o
