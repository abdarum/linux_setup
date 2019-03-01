#Run this at the live disk at beginning
#
#It set user configuration set

function disp_help {
	echo "    Script: $0"
	echo "Options:"
	echo "-a - install most usage programs"
	echo "-b - install boot-repair"
	echo "-s - setup ssh servers"
	echo "-h - display help"
}

function install_programs {
	sudo apt-get update
	sudo apt-get install vim
	sudo apt-get install git
	sudo apt-get install gimp
	sudo apt-get install chromium
}

function install_boot_repair {
	echo "Install boot-repair program"

	sudo add-apt-repository ppa:yannubuntu/boot-repair
	sudo apt-get update
	sudo apt-get install -y boot-repair && boot-repair
}

function setup_ssh {
	mkdir -p ~/.ssh/
	rm -rf ~/.ssh/*
	cp -rf config_ssh_setup_file ~/.ssh/config
}

if [ -z "$1" ] ; then
	disp_help
else
	while getopts "absh" name; do
		case "$name" in
			a)	
				echo "Install most usage programs"
				install_programs
				;;
			b)
				echo "Install boot repair"
				install_boot_repair	
				;;
			s)
				echo "SSH server set up"
				setup_ssh
				;;		
			h|*)
				disp_help
				;;
		esac
	done
fi

