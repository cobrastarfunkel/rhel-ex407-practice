ansible-playbook test.yml --vault-id users@password_file -k

ansible-playbook create_users.yml --tags create --vault-id users@password_file -kK

ansible-playbook create_users.yml --tags destroy --vault-id users@password_file -kK -e ansible_user=ansible
