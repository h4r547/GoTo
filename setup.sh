#Add current directory to $PATH
clear
echo "*-_ Setting up Shell Bookmarks for you _-*"
echo
echo "[+] Adding current directory to \$PATH"
export PATH=$PATH:$(pwd)

#Add path to goto.conf in goto.sh
touch goto.conf
echo
echo "[+] Setting up goto.conf in the current directory"
sed -i '1s/^/goto=$pwd/goto.conf /' goto.sh
echo

#Make goto.sh executable
echo "[+] Making goto.sh executable"
chmod +x goto.sh

#Adding aliases in .bashrc
echo "[+] Adding aliases in .bashrc"
echo "alias setmark='. goto.sh -s'" >> ~/.bashrc
echo "alias goto='. goto.sh -g'" >> ~/.bashrc
echo
echo "[*] Done :)"




