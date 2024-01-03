#! /bin/bash

#run this using chmod +x config.sh

pacman_distros=("Arch" "archlinux" "Manjaro" "EndeavourOS" "Artix" "Garuda" "SteamOS")
debian_distros=("Debian" "Ubuntu" "LinuxMint" "elementaryOS" "Kali Linux" "Pop!_OS" "MXLinux" "ZorinOS" "Deepin" "ParrotOS")
dnf_distros=("Fedora" "CentOS" "RHEL" "RockyLinux" " AlmaLinux" "OracleLinux" "ScientificLinux" "ClearLinux" "Nobara")
distro=$(lsb_release -i | cut -f2)

echo "$pacman_distros" "and" "$distro"
if [[ ${pacman_distros[@]} =~ $distro ]] then
	echo "Distribution: $distro"
	echo "Pacman Package Manager"
elif [[ ${debian_distros[@]} =~ $distro ]] then
	echo "Distribution: $distro"
	echo "APT Package Manager"
elif [[ ${dnf_distros[@]} =~ $distro ]] then
	echo "Distribution: $distro"
	echo "RPM/DNF Package Manager"
elif [[ $distro == "Gentoo" ]] then
	echo "Distribution: $distro"
	echo "Portage/Emerge Package Manager"
elif [[ $distro == "Void" ]] then
	echo "Distribution: $distro"
	echo "XBPS Package Manager"
elif [[ $distro == "OpenSuse" ]] then
	echo "Distribution: $distro"
	echo "Zypper Package Manager"

else
	echo: "Distribution $distro"
	echo "Not a detected package manager"
fi
git config --system core.longpaths true

