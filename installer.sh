#!/bin/bash

echo "This script will install playCopy on your computer."
echo "The program will perform the following actions:"
echo "  - copy the playCopy script to /usr/bin/"
echo "  - add playCopy to /apps/metacity/keybinding_commands/command1 in gconfeditor"
echo "  - add <Control><Alt>c to /apps/metacity/global_keybindings in gconfeditor"
echo ""
echo "if you want to specify a different key combination for starting playCopy type 1"
echo "otherwise hit any other key"

read option

if [ $option == "1" ]; then
	echo "Define you key combination"
	read combination
	echo "You entered: $combination"
	cp playCopy /usr/bin/
	chmod +x /usr/bin/playCopy
	gconftool-2 --type string --set /apps/metacity/keybinding_commands/command_1 "playCopy"
	gconftool-2 --type string --set /apps/metacity/global_keybindings/run_command_1 "$combination"

else
	echo "Installing playCopy to your system"
	cp playCopy /usr/bin/
	chmod +x /usr/bin/playCopy
	gconftool-2 --type string --set /apps/metacity/keybinding_commands/command_1 "playCopy"
	gconftool-2 --type string --set /apps/metacity/global_keybindings/run_command_1 "<Control><Alt>c"
fi
