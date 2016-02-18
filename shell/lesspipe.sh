#!/bin/bash
FILENAME="${1##*/}"

function exec_exists {
    hash $1 2>/dev/null
}

if [ ! -e "$1" ]; then
    exit 1
fi

if [ -d "$1" ]; then
    if [ "$PLATFORM" = "darwin" ]; then
	PROC="CLICOLOR_FORCE=1 ls -lpA \"$1\""
    elif [ "$PLATFORM" = "linux" ]; then
	PROC="ls --color=always -lpA --block-size=\"'1\" \"$1\""
    fi
else
    case "$FILENAME" in
	*.tar.gz|*.tgz )
	    PROC="tar ztvvf \"$1\"" ;;
	*.tar.xz )
	    PROC="tar Jtvvf \"$1\"" ;;
	*.[zZ]|*.gz )
	    FILENAME="${FILENAME%*.*}"
	    PROC="gunzip -c \"$1\"" ;;
	*.bz2 )
	    FILENAME="${FILENAME%*.*}"
	    PROC="bunzip2 -c \"$1\"" ;;
	*.xz )
	    FILENAME="${FILENAME%*.*}"
	    PROC="unxz -c \"$1\"" ;;
	*.gif|*.jpeg|*.jpg|*.pcd|*.png|*.tga|*.tiff|*.tif )
	    if exec_exists identity; then
		PROC="identify \"$1\""
	    elif exec_exists gm; then
		PROC="gm identify \"$1\""
	    else
		>&2 echo "Install ImageMagick or GraphicsMagick to view image data."
		exit 1
	    fi ;;
	*.plist )
	    if exec_exists plutil; then
		PROC="plutil -convert xml1 -o - \"$1\""
		PYGMENTS="xml"
	    fi ;;
	*.so|*.dylib|*.o )
	    if [ "$PLATFORM" = "darwin" ]; then
		PROC="nm \"$1\""
	    elif [ "$PLATFORM" = "linux" ]; then
		PROC="nm -D -C \"$1\""
	    fi ;;
	*.dmg )
	    if exec_exists hdiutil; then
		PROC="hdiutil imageinfo \"$1\""
	    fi ;;
	*.pkg )
	    if exec_exists pkgutil; then
		PROC="pkgutil --payload-files \"$1\""
	    fi ;;
	*.md )
	    if exec_exists pandoc; then
		COLS=$((`tput cols` - 4))
		PROC="pandoc -s -f markdown -t man \"$1\" | groff -rLL=${COLS}n -rLT=${COLS}n -T utf8 -man -"
	    fi ;;
	* )
	;;
    esac
    case "$FILENAME" in
	# makefiles
	*.applescript )
	    PYGMENTS="applescript" ;;
	*.profile|*.sh )
	    PYGMENTS="bash" ;;
	*.[ch] )
	    PYGMENTS="c" ;;
	*.[ch]pp|*.[ch]xx|*.cc|*.hh )
	    PYGMENTS="cpp" ;;
	*.cs )
	    PYGMENTS="csharp" ;;
	*.css )
	    PYGMENTS="css" ;;
	*.diff|*.patch )
	    PYGMENTS="diff" ;;
	*.emacs|*.el )
	    PYGMENTS="elisp" ;;
	*.f )
	    PYGMENTS="fortran" ;;
	*.html|*.xhtml )
	    PYGMENTS="html" ;;
	*.ipynb )
	    PYGMENTS="ipython" ;;
	*.jl )
	    PYGMENTS="julia" ;;
	*.java )
	    PYGMENTS="java" ;;
	*.js )
	    PYGMENTS="javascript" ;;
	Make* )
	    PYGMENTS="make" ;;
	*.m )
	    # could be matlab or obj-c
	    PYGMENTS="matlab" ;;
	*.pl )
	    PYGMENTS="perl" ;;
	*.php )
	    PYGMENTS="php" ;;
	*.ps|*.eps )
	    PYGMENTS="postscript" ;;
	*.py )
	    PYGMENTS="python" ;;
	*.[rR]|.Rhistory|.Rprofile|.Renviron )
	    PYGMENTS="r" ;;
	*.[rR]d )
	    PYGMENTS="rd" ;;
	*.rst )
	    PYGMENTS="rst" ;;
	*.rb )
	    PYGMENTS="ruby" ;;
	*.scm )
	    PYGMENTS="scheme" ;;
	*.sql )
	    PYGMENTS="sql" ;;
	*.swift )
	    PYGMENTS="swift" ;;
	*.tex|*.auc|*.toc )
	    PYGMENTS="tex" ;;
	*.xml|*.xsl|*.xslt|*.rss|*.svg )
	    PYGMENTS="xml" ;;
	* )
	;;
    esac
fi
if [ -n "$PROC" ]; then
    echo ">>>>> $PROC"
    if [ -n "$PYGMENTS" ] && exec_exists pygmentize; then
	eval "$PROC" | pygmentize -l $PYGMENTS
    else
	eval "$PROC"
    fi
    exit $?
else
    if [ -n "$PYGMENTS" ] && exec_exists pygmentize; then
	pygmentize -l $PYGMENTS "$1"
	exit $?
    else
	exit 1
    fi
fi
