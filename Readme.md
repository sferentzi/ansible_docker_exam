# project *ansible docker exam*

## Project Overview

![Project Overview](ansible_docker_exam_overview.png "Project Overview")

## Goal of the project
- To set up an *Ansible* controller.  
- Set up *twoo hosts automatically* from the Ansible hosts, using a *playbook*.
- After running, the *Verification* shown above should pass.

## Content of the Git repository *ansible_docker_exam*
- templates / template_nodejs.j2
- ansible_docker_exam_overview.png
- Dockerfile
- index_d.js
- index.js
- init_hosts
- init_users.yaml
- nodejsapp.service
- Readme.md
- run_hosts
- run_yaml

## For setting up the system, do the steps below !

## Create repo @ GitHub
- name your repo: *ansible_docker_exam*

## Setting up VMs (manually)
- Install Linux centOS 7 on each VM-s
- Set IP-s and Hostnames, as follows:
 - VM 1 setting: 192.168.56.30, ansible-controller, (0)
 - VM 2 setting: 192.168.56.31, ansible-web, (A)
 - VM 3 setting: 192.168.56.32, ansible-nodejs, (B)
 - root / 000000

## Log in to *ansible-controller* as *root*
 
### Install & check Ansible manually
~~~
yum install epel-release
yum install ansible
ansible --version
~~~

### Install Git manually
~~~
yum install git -y
~~~

### Add user exam & set password to 000000
~~~
useradd exam
passwd exam
~~~

### Add user exam to sudoers
~~~
sudo visudo
append line: 
exam ALL=(ALL) NOPASSWD:ALL
~~~

### Make fingerprints as *root* to *web* and *nodejs* (break with ctrl + c)
~~~
ssh 129.168.56.31 -l root
ssh 129.168.56.32 -l root 
~~~

## Add Fingerprint from your Local computer *ansible-controller* as *exam*
~~~
ssh 129.168.56.31 -l exam
~~~

## Open your favourite IDE and log in to *ansible-controller* as *exam*
- Navigate to ~(home) folder (/home/exam)

### Set Git global variables for Git user & check it
~~~
git config --global user.name "Sandor Ferentzi"
git config --global user.email "sandor.ferentzi@gmail.com"
git config --global user.name
git config --global user.email
~~~

### Clone remote Git repository *ansible_docker_exam* and enter folder
~~~
git clone https://github.com/sferentzi/ansible_docker_exam.git
cd ansible_docker_exam
~~~

### Generate ssh-key
~~~
ssh-keygen
~~~

### Create *init_hosts* file
- place to /home/exam/ansible_docker_exam

### Create *init_users.yaml* file
- place to /home/exam/ansible_docker_exam

### Change to user *root*
~~~
sudo su
~~~

### Run the playbook to init users on the *hosts*
- Hint: you shuold be now root@ansible-controller
~~~
ansible-playbook -i init_hosts init_users.yaml -k
~~~

### Change back to user *exam*
- Hint: press ctrl + d

### Make fingerprints as *exam* to *web* and *nodejs*
~~~
ssh 129.168.56.31 -l exam
ssh 129.168.56.32 -l exam 
~~~

## Set Up apache & nodejs

### Create host file run_hosts
- Place it to /home/exam/ansible_docker_exam

### Create yaml file run.yaml
- Place it to /home/exam/ansible_docker_exam

### Run the playbook to set up programs on *hosts*
- Hint: you shuold be now exam@ansible-controller
~~~
ansible-playbook -i run_hosts run.yaml
~~~

## Afterword
Thanks for reading this Reamde. The system is not idempotent 100%, but works. 