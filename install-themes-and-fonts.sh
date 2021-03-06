#!/usr/bin/env bash

install_phpstorm_theme() {
    for folder in $(ls -a ~); do
        if [[ $folder == .PhpStorm* ]] ;
        then
            cp themes/phpstorm/Rooxie.icls ~/$folder/config/colors/Rooxie.icls
        fi
    done
}

install_local_fonts() {
    for font in $(ls -p fonts | grep -v /); do
        cp fonts/$font ~/.local/share/fonts/$font
    done
}

install_sanfrancisco_fonts() {
    git clone git@github.com:AppleDesignResources/SanFranciscoFont.git &> /dev/null
    rm SanFranciscoFont/README.md

    for font in $(ls -p SanFranciscoFont | grep -v /); do
        cp SanFranciscoFont/$font ~/.local/share/fonts/$font
    done
}

install_mono_fonts() {
    git clone git@github.com:tsenart/sight.git &> /dev/null

    for font in $(ls -p sight/fonts | grep -v /); do
        cp sight/fonts/$font ~/.local/share/fonts/$font
    done
}

mkdir tmp
cd tmp

install_mono_fonts
install_sanfrancisco_fonts

cd ..
rm -rf tmp

install_local_fonts
install_phpstorm_theme

fc-cache -f -v
