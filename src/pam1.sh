set -o allexport
source .env

USER_NOT_PERMISSED="generico"

LINE="auth required pam_listfile.so item=user sense=deny file=/etc/ssh/ssh.deny onerr=succeed"

echo $LINE >> /etc/pam.d/sshd

#creacion del fichero para negar acceso a usuarios especificos
sudo touch /etc/ssh/ssh.deny

# Agregado al final del usuario no permitido
echo $USER_NOT_PERMISSED >> /etc/ssh/ssh.deny