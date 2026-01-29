# Avant-Garde
A robust and extensible desktop shell made with Quickshell, built for hyprland.
![showcase](https://github.com/ya-pseudonym/avant-garde/blob/master/showcase.png)
This is just the shell. You will need to collect a few dependencies for it to fully work.
The collected list of dependencies is below:
<br>
```
matugen quickshell upower ttf-space-mono-nerd
```
You'll need to install the Google Sans Flex font for proper display of interface elements
<br>
https://fonts.google.com/specimen/Google+Sans+Flex
<br>
move the downloaded font to ```/usr/share/fonts/TTF```
<br>

## Customization

A lot of parameter modification can be done without even changing the variables present in Config.qml
To see what's possible, run ```qs ipc show``` in your terminal. 
It's recommended to set an alias in your .bashrc if you want to quickly change variables on the fly.
Example bash function to set parameters:
```
setradius() {
  echo "Setting defaultRadius to $1";
  qs ipc call config setRadius $1;
}
```
This function sets the defaultRadius variable present in Config.qml to whatever you specify it to be.
<br>
### Blur dispatching
```
You will need to set a layerrule in your `hyprland.conf` to dispatch blur to the shell elements.
Example layerrules:
```
layerrule = blur on, match:namespace ag-dash
layerrule = ignore_alpha 0, match:namespace ag-dash

## Todo:
  - Install script
  - Dynamic theme management & actual implementation of JSON themes
  - Settings menu for changing matugen color scheme generation and wallpaper
  - Login & lock screen
  - Make skeletal powermenu buttons... not skeletal
  
