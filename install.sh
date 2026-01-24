#!/bin/bash

install_component() {
    local script_name=$1
    local component_name=$2
    
    read -p "Install $component_name components?(Y/N) " answer
    if [[ "$answer" =~ ^[Yy]$ ]]; then
        echo "Looking for the required script..."
        if [ -f "./scripts/$script_name.sh" ]; then
            chmod +x "./scripts/$script_name.sh"
            "./scripts/$script_name.sh"
            echo "$component_name packages installed successfully"
        else
            echo "The required script isn't found"
            exit 1
        fi
    else
        echo "Installation of $component_name canceled"
    fi
}

install_component "system" "basic system"
install_component "graphic" "graphic"
install_component "workplace" "workplace"

exit 0
