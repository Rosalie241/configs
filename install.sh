CORE_DEPENDENCIES="xorg-server xorg-xinit xorg-xrandr tint2 git"
DEPENDENCIES="xterm rxvt-unicode feh rofi nautilus
		obconf lxappearance
		xfce4-screenshooter arandr"
THEME_DEPENDENCIES="arc-gtk-theme arc-icon-theme compton"
GNOME_DEPENDENCIES="gnome-calculator pavucontrol gnome-mplayer 
	gucharmap xarchiver gimp"
EXTRAS="firefox chromium mplayer libreoffice pidgin vlc redshift gksu gparted"
if `which pacman > /dev/null 2>&1`; then
	sudo pacman --needed --noconfirm -S $CORE_DEPENDENCIES $DEPENDENCIES \
				$THEME_DEPENDENCIES $GNOME_DEPENDENCIES $EXTRAS
	# Installing prebuilt packages
	echo Installing prebuilt packages!
	sudo pacman --needed -U prebuilt/*pkg.tar*
else
	echo pacman is not installed!	
fi
echo Installing configs
mkdir -p ~/.config/
mkdir -p ~/.themes/
mkdir -p ~/Pictures/wallpaper
cp -R dotfiles/.config/* ~/.config/
cp -R dotfiles/.themes/* ~/.themes/
cp -R wallpaper/* ~/Pictures/wallpaper/
cp dotfiles/.gtkrc-2.0 ~/.gtkrc-2.0 
cp dotfiles/.Xdefaults ~/.Xdefaults
echo "exec openbox-session" > ~/.xinitrc
xrdb ~/.Xdefaults
echo Done!
