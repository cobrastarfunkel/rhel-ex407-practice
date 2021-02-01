#!/bin/bash

ansible -m user -a "name='automation' groups='wheel'" combined --become -kK -e ansible_user=ansible

ansible -m authorized_key -a "user=automation state=present key={{ lookup('file', '/home/automation/.ssh/id_rsa.pub')}}" combined --become -kK -e ansible_user=ansible

ansible -m lineinfile -a "path=/etc/sudoers regex='^%wheel.*ALL=' line='%wheel  ALL=(ALL)       NOPASSWD: ALL' validate='/usr/sbin/visudo -cf %s'" combined --become -kK  -e ansible_user=ansible

 ansible -m shell -a "cat /etc/sudoers | grep ALL" combined --become
