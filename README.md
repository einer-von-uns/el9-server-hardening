# 🏴‍☠️ EL9 Server Hardening Fortress

Dieses Projekt sichert eine **Rocky Linux 9 (EL9)** Kvm machine gegen feindliche Enterkommandos ab. Es hebt das Sicherheitsniveau von einer labilen 2 auf eine **starke 8 von 10**!

## 🛡️ Die 5 Verteidigungs-Schritte:
1. **Geheimer SSH-Port**: Verlegt den Standard-Port von 22 auf **2222**.
2. **Kapitän im Versteck**: Verbietet den direkten SSH-Login für den Benutzer `root`.
3. **Krypto-Schloss**: Schaltet Passwörter für SSH komplett ab (Nur noch SSH-Keys erlaubt).
4. **Automatische Flicken**: Aktiviert `dnf-automatic` für tägliche Sicherheits-Updates im Hintergrund.
5. **Ketten für Angreifer**: Installiert `fail2ban`, um feindliche IP-Adressen bei Bruteforce sofort zu blockieren.

## 🚀 Anwendung:
```bash
chmod +x hardening.sh
./hardening.sh
```
