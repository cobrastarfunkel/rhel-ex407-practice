#!/bin/bash

ansible -m user -a "user=automation password={{ user_password }} groups=wheel state=present" combined -kK --become -u ansible --vault-id users@vault_key

ansible -m authorized_key -a "user=automation state=present key={{ lookup('file', '/home/automation/.ssh/id_rsa.pub') }}" combined -kK --become --vault-id users@vault_key

ansible -m lineinfile -a "path=/etc/sudoers regex='^%wheel ' line='%wheel All=(ALL)  NOPASSWD:ALL'" combined -K --become --vault-id users@vault_key --diff
