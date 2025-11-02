set -o allexport
source .env

# Conectar a servidor SSH
# ssh root@$IP
# exit

ssh-keygen -t ed25519 -C $EMAIL

#ssh "$USER@$IP"


# Copiar clave pública al servidor
ssh-copy-id "$USER_SSH@$IP"

# Conexión interactiva
ssh -v "$USER_SSH@$IP"

# Mostrar authorized_keys remoto
ssh "$USER_SSH@$IP" 'cat ~/.ssh/authorized_keys'

# Reinicio del servidor SSH
# sudo systemctl reload sshd