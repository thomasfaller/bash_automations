# bash_automations

## Description
This is a repository used for backing up and documenting my most-used shell scripts.

`createAutoSshConn.sh`

- dependencies:
  - ssh-keygen
  - sshpass

This script will prompt you an IP address, a password, a username and another name for the key.

it will then:
  1) Create a SSH key using ssh-keygen
  2) Connect to the remote machine and create a '.ssh' directory there.
  3) Copy the SSH key created in 1) inside the ~/.ssh/authorized_keys folder.

The programm could be improved by:
  - asking for a level of encryption for the key.
  - checking prior to key creation wheither a file already exists with the sme name
  - ping the IP address provided to see if the server responds
  - check if a .ssh directoty is already present and jump to 3) if so.
