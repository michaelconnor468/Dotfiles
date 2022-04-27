#!/bin/sh
DOTFILES_REPO="git@github.com:michaelconnor468/Dotfiles.git"

push () {
    if [ $# -eq 2 ]; then
        if [ $2 = "all" ]; then
            pacman -Qq > pacman.txt
            for f in `find etc -maxdepth 1 -mindepth 1 -type d`;
            do
                from_dir=`echo $f | awk 'BEGIN {FS="/"} {print $3}'`
                rsync -a /etc/$from_dir etc
            done
        fi
    fi
    for f in `find config -maxdepth 1 -mindepth 1 -type d`;
    do
        from_dir=`echo $f | awk 'BEGIN {FS="/"} {print $2}'`
        rsync -a ~/.config/$from_dir config
    done
    exit 0
    git add config
    git commit -am "Update tracked config folders to latest local edition"
    git push origin master
}

pull () {
    git pull origin master
    rsync -a config/* ~/.config
    if [ $# -eq 2 ]; then
        if [ $2 = "all" ]; then
            rsync -a etc/* /etc
        fi
    fi
}

install () {
    pull pull all
    # install yay if not present
    # install all packages from pacman.txt
    echo install
}

ehco_usage () {
    echo "Usage: setup.sh <push|pull|install>"
}

if [ $# -lt 1 ]; then
    ehco_usage
    exit 1
fi

if [ $1 = "push" ]; then
    push $*
    exit 0
elif [ $1 = "pull" ]; then
    pull
    exit 0
elif [ $1 = "install" ]; then
    install
    exit 0
else
    ehco_usage
    exit 1
fi
