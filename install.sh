#!/bin/bash

if [ `whoami` != 'root' ];then
    echo -e "\033[1;91m"
    echo -e "\t\t\t!! Run with sudo !! " 
    exit 
fi

echo "Installing tools..."
apt-get -qq update
apt-get -qq install pip jq whois amass libpcap-dev unzip -y 
chmod +x frogy.sh
git clone https://github.com/rbsec/dnscan.git 2>/dev/null 
pip -qq install -r dnscan/requirements.txt 

GOlang() {
	printf "                                \r"
	sys=$(uname -m)
	#LATEST=$(curl -s 'https://go.dev/VERSION?m=text') # https://golang.org/dl/$LATEST.linux-amd64.tar.gz
	[ $sys == "x86_64" ] && wget https://go.dev/dl/go1.17.13.linux-amd64.tar.gz -O golang.tar.gz &>/dev/null || wget https://golang.org/dl/go1.17.13.linux-386.tar.gz -O golang.tar.gz &>/dev/null
	sudo tar -C /usr/local -xzf golang.tar.gz
	echo "export GOROOT=/usr/local/go" >> $HOME/.bashrc
	echo "export GOPATH=$HOME/go" >> $HOME/.bashrc
	echo 'export PATH=$PATH:$GOROOT/bin:$GOPATH/bin' >> $HOME/.bashrc
	
	printf "[+] Golang Installed !.\n"
}

function project_discovery(){
    case $(arch) in
        x86_64)
            cpu='amd64'
            ;;
        i686 | i386)
            cpu='386'
            ;;
        aarch64)
            cpu='arm64'
            ;;
        *)
            cpu='amd64'
            ;;
        esac

    for tool in {httpx,subfinder,dnsx,katana}
    do
        version=$(curl -IkLs -o /dev/null -w %{url_effective}  https://github.com/projectdiscovery/$tool/releases/latest|grep -o "[^/]*$"| sed "s/v//g")
        baseurl="https://github.com/projectdiscovery/$tool/releases/download/v$version/"$tool"_$version"_linux_"$cpu.zip"
        wget -q $baseurl -O $tool.zip 
        unzip -qo $tool.zip  
        chmod +x $tool && mv $tool /usr/bin/ 
        rm $tool.zip
    done

}

function tomnomnom(){
    case $(arch) in         
    x86_64)
        cpu='amd64'
        ;;
    i686 | i386)
        cpu='386'
        ;;
    *)
        cpu='amd64'
        ;;
    esac

    for tool in {anew,waybackurls,unfurl}
    do
        version=$(curl -IkLs -o /dev/null -w %{url_effective}  https://github.com/tomnomnom/$tool/releases/latest|grep -o "[^/]*$"| sed "s/v//g")
        baseurl="https://github.com/tomnomnom/$tool/releases/download/v$version/$tool-linux-$cpu-$version.tgz"        
        wget -q $baseurl -O $tool.tgz 
        tar xzf "$tool.tgz"
        chmod +x $tool && mv $tool /usr/bin/ 
        rm $tool.tgz
    done
}


function find_domain(){
    case $(arch) in         
    x86_64)
        cpu='-linux'
        ;;
    i686 | i386)
        #calling i386 function
        cpu='-linux-i386'
        ;;
    aarch64)
        #calling aarch function
        cpu='-aarch64'
        ;;
    *)
        cpu='-linux'
        ;;
    esac
    findomain_version=$(curl -IkLs -o /dev/null -w %{url_effective}  https://github.com/Findomain/Findomain/releases/latest|grep -o "[^/]*$"| sed "s/v//g")
    baseurl="https://github.com/Findomain/Findomain/releases/download/$findomain_version/findomain$cpu.zip"
    wget -q $baseurl -O findomain.zip 
    unzip -qo findomain.zip 
    chmod +x findomain && mv findomain /usr/bin/
    rm findomain.zip  
}

#Calling functions to downlaod binary file & move to /usr/bin
project_discovery
tomnomnom
find_domain

echo "Installation completed successfully!"

## to add

# Findomain() {
#     printf "                                \r"
#     wget https://github.com/Findomain/Findomain/releases/download/8.2.1/findomain-linux.zip &>/dev/null
#     unzip findomain-linux.zip
#     chmod +x findomain
#     ./findomain -h &>/dev/null && { sudo mv findomain /usr/local/bin/; printf "[+] Findomain Installed !.\n"; } || printf "[!] Install Findomain manually: https://github.com/Findomain/Findomain/blob/master/docs/INSTALLATION.md\n"
# }

# Subfinder() {
#     printf "                                \r"
#     GO111MODULE=on go get -u -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder &>/dev/null
#     printf "[+] Subfinder Installed !.\n"
# }

# Assetfinder() {
#     printf "                                \r"
#     go get -u github.com/tomnomnom/assetfinder &>/dev/null
#     printf "[+] Assetfinder Installed !.\n"
# }

# Httprobe() {
#     printf "                                \r"
#     go get -u github.com/tomnomnom/httprobe
#     printf "[+] Httprobe Installed !.\n"
# }

# Parallel() {
#     printf "                                \r"
#     sudo apt-get install parallel -y
#     printf "[+] Parallel Installed !.\n"
# }
