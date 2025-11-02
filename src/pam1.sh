set -o allexport
source .env

LINE="auth required pam_listfile.so item=user sense=deny file=/etc/ssh/ssh.deny onerr=succeed"

echo $LINE >> /etc/pam.d/sshd