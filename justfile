# Dotfiles management
DOTFILES_REPO := "git@github.com:michaelconnor468/Dotfiles.git"

# List available recipes
default:
    @just --list

# Stage config files from system to repo (use 'just stage all' for etc too)
stage all="":
    #!/bin/sh
    if [ "{{all}}" = "all" ]; then
        pacman -Qq > packages
        for f in $(find etc -maxdepth 1 -mindepth 1 -type d); do
            rsync -a /$f .
        done
    fi
    for f in $(find config -maxdepth 1 -mindepth 1 -type d); do
        from_dir=$(echo $f | awk 'BEGIN {FS="/"} {print $2}')
        rsync -a ~/.config/$from_dir config
    done

# Stage, commit, and push changes (use 'just push all' for etc too)
push all="":
    just stage {{all}}
    git add config etc
    git commit -am "Update tracked config folders to latest local edition"
    git push origin master

# Update config files from repo to system (use 'just update all' for etc too)
update all="":
    rsync -a config/* ~/.config
    {{ if all == "all" { "sudo rsync -a etc/* /etc" } else { "" } }}

# Pull from remote and update (use 'just pull all' for etc too)
pull all="":
    git pull origin master
    just update {{all}}

# Full installation: pull, install yay, install all packages
install:
    #!/bin/sh
    just pull all
    sudo pacman -S --needed base-devel git
    if [ ! -d /opt/yay ]; then
        sudo git clone https://aur.archlinux.org/yay.git /opt/yay
        sudo chown -R $USER:$USER /opt/yay
        cd /opt/yay && makepkg -si
    fi
    yay -Syyu
    for package in $(cat packages); do
        yay -S --needed --noconfirm $package
    done
