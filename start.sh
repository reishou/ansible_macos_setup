/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew ls --versions ansible || brew install ansible
brew outdated ansible || brew upgrade ansible

brew ls --versions git || brew install git
brew outdated git || brew upgrade git

dir="/tmp/$RANDOM"
mkdir "$dir"
git clone https://github.com/reishou/ansible_macos_setup.git $dir

if [ ! "$(ls -A "$dir")" ]; then
	# @TODO: check ansible file exist
	echo "Empty folder"
	exit 1
else
 	echo "Run ansible"
 	ansible-playbook main.yml -i inventory --ask-become-pass
fi
