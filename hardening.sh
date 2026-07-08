#!/bin/bash
# EL9-Server-Hardening-Skript für Rocky Linux 9

echo "🏴‍☠️ Starte EL9 Hardening..."
# 1. SSH-Port auf 2222 ändern & Firewall anpassen
sudo sed -i 's/#Port 22/Port 2222/' /etc/ssh/sshd_config
sudo semanage port -a -t ssh_port_t -p tcp 2222 2>/dev/null || true
sudo firewall-cmd --permanent --add-port=2222/tcp
sudo firewall-cmd --permanent --remove-service=ssh
sudo firewall-cmd --reload

# 2. Root-Login & Passwort-Authentifizierung verbieten
sudo sed -i 's/PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sudo sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sudo systemctl restart sshd

# 3. Sicherheitsupdates & Fail2Ban aktivieren
sudo dnf install -y dnf-automatic epel-release fail2ban
sudo sed -i 's/upgrade_type = default/upgrade_type = security/' /etc/dnf/automatic.conf
sudo systemctl enable --now dnf-automatic.timer fail2ban

echo "✅ Fregatte ist unkapertbar gesichert!"
