names=$(docker container ls --format '{{.Names}}')

for name in $names
do ansible-playbook -i hosts.ini playbook.yml -e "container=$name"
done
