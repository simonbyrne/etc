SYMLINKS := ~/.profile ~/.emacs ~/.gitconfig ~/.screenrc ~/.Rprofile

symlinks: ${SYMLINKS}

# get rid of all symlinks into ~/etc
cleanall:
	find ~ -maxdepth 1 -lname '${CURDIR}/*' | xargs -t rm 

# get rid of broken symlinks into ~/etc
clean:
	find ~ -maxdepth 1 -lname '${CURDIR}/*' -exec test "!" -e {} \; -print | xargs -t rm 


~/.profile : shell/profile.sh
~/.emacs : emacs/emacs.el
~/.gitconfig : git/config
~/.screenrc : screen/screenrc
~/.Rprofile : R/profile.r

${SYMLINKS} :
	ln -i -s ${CURDIR}/$< $@

.PHONY: symlinks clean cleanall
