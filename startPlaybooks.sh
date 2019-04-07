# Some image versions don't contain python, so we need to install it
docker exec -it debian /bin/sh -c "apt-get update && apt-get install python -y"

names=$(docker container ls --format '{{.Names}}')

for name in $names
do ansible-playbook -i hosts.ini playbook.yml -e "container=$name"
done
