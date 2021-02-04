check_xcode="$(xcode-select --version)"
echo "$check_xcode"

if [ "$check_xcode" == "" ]; then
	xcode-select --install
fi

check_homebrew="$(brew --version)"
echo "$check_homebrew"

if [ "$check_homebrew" == "" ]; then
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew ls --versions ansible || brew install ansible
brew outdated ansible || brew install ansible

brew ls --versions git || brew install git
brew outdated git || brew upgrade git

dir="/tmp/$RANDOM"
mkdir "$dir"
git clone git@github.com:reishou/ansible_macos_setupw.git $dir

if [ ! "$(ls -A "$dir")" ]; then
	# @TODO: check ansible file exist
	echo "Empty folder"
	exit 1
else
 	echo "Run ansible (TODO)"
fi
