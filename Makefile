SYMLINKS := ~/.profile ~/.emacs ~/.gitconfig ~/.screenrc ~/.Rprofile

symlinks: ${SYMLINKS}

cleanall:
	find ~ -maxdepth 1 -lname '${CURDIR}/*' | xargs -t rm 

clean:
	find ~ -maxdepth 1 -lname '${CURDIR}/*' -exec test "!" -e {} \; -print | xargs -t rm 


~/.profile : shell/profile.sh
~/.emacs : emacs/emacs.el
~/.gitconfig : git/config
~/.screenrc : screen/screenrc
~/.Rprofile : R/profile.r

${SYMLINKS} :
	ln -s ${CURDIR}/$< $@

.PHONY: symlinks clean cleanall
