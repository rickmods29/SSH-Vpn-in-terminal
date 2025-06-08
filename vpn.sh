#!/data/data/com.termux/files/usr/bin/bash

# 🛡️ Rick Mods - Indian IP SSH VPN Script

user="root"
ip="192.0.2.1"
port="22"

banner() {
  clear
  echo -e "\e[1;34m╔══════════════════════════════════════════════════╗\e[0m"
  echo -e "\e[1;34m║\e[0m        \e[1;36m🛡️ RICK MODS - INDIAN SSH VPN\e[0m              \e[1;34m║\e[0m"
  echo -e "\e[1;34m╠══════════════════════════════════════════════════╣\e[0m"
  echo -e "\e[1;34m║\e[0m \e[1;33mAuthor  : Harisankar (Rick Mods)\e[0m                 \e[1;34m║\e[0m"
  echo -e "\e[1;34m║\e[0m \e[1;33mProxy   : SOCKS5 (127.0.0.1:$port)\e[0m                  \e[1;34m║\e[0m"
  echo -e "\e[1;34m║\e[0m \e[1;33mServer  : $ip\e[0m                              \e[1;34m║\e[0m"
  echo -e "\e[1;34m╚══════════════════════════════════════════════════╝\e[0m"
}

connect_ssh() {
  echo -e "\e[1;36m⏳ Connecting to \e[0m$user@$ip \e[1;36musing SOCKS5 on port $port...\e[0m"
  ssh -D $port -q -C -N $user@$ip &
  SSH_PID=$!

  sleep 5

  if ps -p $SSH_PID > /dev/null; then
    echo -e "\e[1;32m✅ SSH Tunnel successfully established!\e[0m"
    echo -e "\e[1;36m🌐 Set your browser SOCKS5 to 127.0.0.1:$port\e[0m"
    echo -e "\e[1;33m🔄 Tunnel running... Press CTRL + C to stop.\e[0m"
    wait $SSH_PID
  else
    echo -e "\e[1;31m❌ SSH Tunnel failed.\e[0m"
    echo -e "\e[1;37m💡 Check SSH server, IP, and network.\e[0m"
  fi
}

# Run the script
banner
connect_ssh
