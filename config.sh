#Run this at the live disk at beginning
#
#It set user configuration set

function disp_help {
	echo "    Script: $0"
	echo "Options:"
	echo "-a - install most usage programs"
	echo "-m - install AVR and STM8 compilator and toolchain"
	echo "-r - install repair tools(boot-repair and Gparted)"
	echo "-s - setup ssh servers"
	echo "-h - display help"
}

function install_programs {
	sudo apt-get update
	sudo apt-get install vim
	sudo apt-get install git
	sudo apt-get install gimp
	sudo apt-get install chromium
	sudo apt-get install deluge
}

function install_repair_tools{
	sudo add-apt-repository ppa:yannubuntu/boot-repair
	sudo apt-get update
	sudo apt-get install -y boot-repair
	sudo apt-get install gparted
}

function setup_ssh {
	mkdir -p ~/.ssh/
	rm -rf ~/.ssh/*
	cp -rf config_ssh_setup_file ~/.ssh/config
}

function install_avr_and_stm8_compilator {
	sudo apt-get update
	sudo apt-get install binutils gcc-avr avr-libc uisp avrdude flex byacc bison
	sudo apt-get install sdcc
	sudo apt-get install libusb-1.0-0-dev
	#https://www.cnx-software.com/2015/04/13/how-to-program-stm8s-1-board-in-linux/
	#https://www.ondrovo.com/a/20170107-stm8-getting-started/
}

if [ -z "$1" ] ; then
	disp_help
else
	while getopts "amrsh" name; do
		case "$name" in
			a)	
				echo "Install most usage programs"
				install_programs
				;;
			m)
				echo "Install AVR compilator and toolchain"
				install_avr_and_stm8_compilator
				;;
			r)
				echo "Install repair tools"
				install_repair_tools
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

