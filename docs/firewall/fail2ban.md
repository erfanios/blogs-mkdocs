# Fail2ban

```bash
# List all rules:
sudo fail2ban-client status

# see the status of a rule:
sudo fail2ban-client status <rule>

# Unbann all ips of one rule:
sudo fail2ban-client unban --all <rule>

# See banned ip and all in iptables:
sudo iptables -L -n
```

# iptables

```bash
# List rules
# -L = List
# -v = Verbose
# -n = nummeric, it prevents the ip from being resolved as domain names
sudo iptables -L -v -n

# Ban ip
sudo iptables -A INPUT -s <IP_ADDRESS> -j DROP

# Unban
sudo iptables -D INPUT -s <IP_ADDRESS> -j DROP
```
