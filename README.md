
#FileSync

##Overview##

**file-synchronizer** is a node module for synchronizing files between a local and remote file repository.  The remote file repository is a express web app.

This is my first attempt at a coffee-script library so pleae be patient.

###Build Instructions###

To build the project…

####Pull in dependencies####
	npm install

####Run all tests####
	./node_modules/.bin/cake test

####Install locally####
	npm install -g
	
###Syntax###

See differences between local and remote files

	filesync --diff

… obviously there will be more to come...