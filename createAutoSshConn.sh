#!/bin/bash
echo '##################################'
echo '# Create a secure SSH connection #'
echo '##################################'
echo 
read -p 'Ip Address: ' IPVAR
read -p 'Username: ' USERVAR
read -sp 'Password: ' PASSVAR
read -p 'Private key: ' KEYVAR
echo


function create_rsa_key {
	ssh-keygen -t rsa -f /home/thomas/.ssh/$KEYVAR -q -N ""
	test -f /home/thomas/.ssh/$KEYVAR.pub && echo "$KEYVAR.pub created in /home/thomas/.ssh/..."

}

function ssh_conn {
	sshpass -p "$PASSVAR" ssh -o StrictHostKeyChecking=no $USERVAR@$IPVAR
}


function create_ssh_dir {

	sshpass -p "$PASSVAR" ssh -o StrictHostKeyChecking=no $USERVAR@$IPVAR mkdir -p .ssh
	echo ".ssh directory created on $IPVAR..."

}

function add_key_to_authorized {

	cat .ssh/$KEYVAR.pub | sshpass -p "$PASSVAR" ssh -o StrictHostKeyChecking=no $USERVAR@$IPVAR 'cat >> .ssh/authorized_keys'
	echo "$KEYVAR key added to authorized_keys on $IPVAR."

}


create_rsa_key
create_ssh_dir
add_key_to_authorized

