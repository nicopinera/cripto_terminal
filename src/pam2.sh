set -o allexport
source .env

sudo apt-get update
sudo apt-get install libpam-google-authenticator -y # Instalar google authenticator
google-authenticator # ejecuto la aplicacion para generar el codigo QR

sudo cp /etc/pam.d/sshd /etc/pam.d/sshd.back # hago una copia de seguridad del archivo sshd

sudo cat >> /etc/pam.d/sshd << EOL
# Standard Un*x password updating
# include common-password
auth required pam_google_authenticator.so nullok
auth required pam_permit.so
EOL

#sudo tee -a /etc/pam.d/sshd > /dev/null << 'EOL'
# Standard Un*x password updating
#@include common-password
#auth required pam_google_authenticator.so nullok
#auth required pam_permit.so
#EOL

sudo cp /etc/ssh/sshd_config /etc/ssh/sshd_config.back # hago una copia de seguridad del archivo sshd_config

#Establecer valor en yes para Challenge ResponseAuthentication
sudo sed -i 's/^#\?ChallengeResponseAuthentication.*/ChallengeResponseAuthentication yes/' /etc/ssh/sshd_config

sudo systemctl restart ssh.service # reinicio el servicio ssh

sudo cat >> /etc/ssh/sshd_config << EOL
AuthenticationMethods publickey,keyboard-interactive
EOL

sudo systemctl restart sshd.service # reinicio el servicio sshd
