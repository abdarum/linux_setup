#Run this at the live disk at beginning
#
#It set user configuration set

function disp_help {
	echo "    Script: $0"
	echo "Options:"
	echo "-b - install boot-repair"
	echo "-h - display help"

rm -rf ~/.ssh/
cp -rf ./PersonalData/Config/.ssh ~/

while getops bh name; do
	case $name in
		b)
			echo "Install boot-repair program"

			sudo add-apt-repository ppa:yannubuntu/boot-repair
			sudo apt-get update
			sudo apt-get install -y boot-repair && boot-repair
			;;
		h)
			disp_help
			;;
		*)
			echo ""
	esac
done


