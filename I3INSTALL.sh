###############################################

# VOID LINUX + i3WM FULL SETUP SCRIPT (SDDM)

###############################################



# Update

xbps-install -Su



# Install core system and desktop components

xbps-install -S xorg xrandr terminus-font

xbps-install -S dbus elogind polkit NetworkManager doas nano



# Install i3 and apps

xbps-install -S i3wm i3status picom rofi dunst polybar

xbps-install -S pcmanfm thunar feh

xbps-install -S sakura xterm htop neofetch firefox geany chromium



# Audio

xbps-install -S pulseaudio pavucontrol



# Login manager

xbps-install -S sddm



# Enable services

ln -s /etc/sv/dbus /var/service

ln -s /etc/sv/elogind /var/service

ln -s /etc/sv/polkitd /var/service

ln -s /etc/sv/NetworkManager /var/service

ln -s /etc/sv/sddm /var/service



# Keyboard layout permanent

echo 'setxkbmap -layout "us,rs,rs" -variant ",latin," -option grp:ctrl_shift_toggle' >> ~/.bashrc



# Timezone

timedatectl set-timezone Europe/Belgrade



# Create i3 config (only if it does not exist)

mkdir -p ~/.config/i3

cat << 'EOF' > ~/.config/i3/config

set $mod Mod4



font pango:Terminus 12



exec --no-startup-id picom &

exec --no-startup-id feh --bg-scale /home/joe/Downloads/MyDarlingCatPicture.jpg &

exec --no-startup-id setxkbmap -layout "us,rs,rs" -variant ",latin," -option grp:ctrl_shift_toggle

exec --no-startup-id nm-applet &

exec --no-startup-id volumeicon &



bindsym $mod+d exec rofi -show drun

bindsym $mod+Shift+t exec sakura

bindsym $mod+Shift+w exec firefox

bindsym $mod+Shift+d exec geany

bindsym $mod+Shift+f exec thunar

EOF



###############################################

echo "INSTALLATION COMPLETE — REBOOTING!"

###############################################

reboot



#Just copy-paste to I3INSTALL.sh


#Run this script with ./I3INSTALL.sh