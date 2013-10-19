all: setup

setup: install 

install: install-general install-python install-dotfiles
uninstall: uninstall-general uninstall-python

install-general:
	yum install -y tmux
uninstall-general:
	yum erase -y tmux

install-python:
	yum install -y python-pip scipy python-devel postgresql-devel 
	pip install ipython django
uninstall-python:
	yum erase -y python-pip scipy python-devel postgresql-devel
	pip install ipython django virtualenv

install-dotfiles:
	git clone https://github.com/axelmagn/dotfiles.git $HOME/.dotfiles
	(cd $HOME/.dotfiles && exec ./install.sh)

create-build:
	mkdir build
clean-build:
	rm -rf build
