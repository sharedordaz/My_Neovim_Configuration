#! /bin/bash

#run this using chmod +x config.sh
command_exists(){
    command -v ""
}

pacman_distros=("Arch Linux" "Manjaro" "EndeavourOS" "Artix Linux" "Garuda Linux")

distro=$(lsb_release -d | cut -f2)

if ["$pacman_distros[@]" =~ "${distro}"]; then
	echo "Distribution: $distro"
	echo "Pacman Package Manager"


git config --system core.longpaths true
