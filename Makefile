config_ssh:
	chmod +x src/config_ssh.sh
	./src/config_ssh.sh

config_pam:
	chmod +x src/pam1.sh
	sudo ./src/pam1.sh

config_fail2ban:
	chmod +x src/fail2ban.sh
	sudo ./src/fail2ban.sh