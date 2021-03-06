SYMLINKS := ~/.bash_profile ~/.emacs ~/.gitconfig ~/.screenrc ~/.tmux.conf ~/.Rprofile ~/.inputrc

REPLACE = -i

symlinks: ${SYMLINKS}

# get rid of all symlinks into ~/etc
cleanall:
	find ~ -maxdepth 1 -lname '${CURDIR}/*' | xargs -t rm 

# get rid of broken symlinks into ~/etc
clean:
	find ~ -maxdepth 1 -lname '${CURDIR}/*' -exec test "!" -e {} \; -print | xargs -t rm 


~/.bash_profile : shell/profile.sh
~/.inputrc : shell/inputrc
~/.emacs : emacs/emacs.el
~/.gitconfig : git/config
~/.screenrc : screen/screenrc
~/.tmux.conf : tmux/tmux.conf
~/.Rprofile : R/profile.r

${SYMLINKS} :
	ln ${REPLACE} -s ${CURDIR}/$< $@

.PHONY: symlinks clean cleanall
