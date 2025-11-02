set -o allexport
source .env

sudo apt update

# instalo fail2ban e iptables
sudo apt install fail2ban iptables -y

# compruebo el estado del servicio fail2ban
sudo systemctl status fail2ban.service

cd /etc/fail2ban

sudo cp jail.conf jail.local

# edito el archivo de configuracion local
sudo nano jail.local

sudo systemctl restart fail2ban