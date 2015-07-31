#!/bin/bash
if [ -z "$2" ]; then
	docker_name='bigobject'
else
	docker_name=$2
fi
	
cat $1 | sudo docker exec -i $docker_name bash -c "/bin/cat > /lua/$1"
