set -o allexport
source .env

# Conectar a servidor SSH
#ssh root@$IP
#exit

ssh-keygen -t ed25519 -C $EMAIL

ssh "$USER"@"$IP"


# Copiar clave publica
ssh-copy-id $USER@$IP

ssh -v "$USER"@"$IP"

cat ~/.ssh/authorized_keys