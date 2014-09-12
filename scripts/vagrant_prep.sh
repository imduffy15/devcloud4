#!/bin/bash
#
# Script to automate the install of vagrant plugins.
#

# Vagrant checks
check_vagrant=$(vagrant -v | wc -l)

# Check if Vagrant is installed
if [ $check_vagrant -eq 0 ] ; then
    echo -e "\nVagrant not installed.  Please install vagrant and re-run script...exiting.\n"
    exit
else
    vagrant_loc=`which vagrant`
fi

# Vagrant plugin installs
vagrant_mod() {
    for val in ${plugin_checks[@]} ; do
        check_plugin=`$vagrant_loc plugin list | grep -c -i $val`
        if [ "$check_plugin" -eq "0" ] ; then
            echo -e "\nInstalling Vagrant Plugin $val..."
            if [ "$val" == "license" ] ; then
                    if [ -f $license_file ] ; then
                        $vagrant_loc plugin $val vagrant-vmware-fusion $license_file
                    else
                        echo -e "\nVMWARE $license_file file not found.  Please obtain valid VMWare license and re-run script...exiting.\n"
                        exit
                    fi
            else
                $vagrant_loc plugin install vagrant-$val
            fi
        fi
    done
    echo -e "All plugins are installed!"
}

case $1 in
	vbox)
		plugin_checks=("librarian-chef" "omnibus")
		vagrant_mod
		;;
	*)
		echo -e "\nUsage: $0 vbox" >&2
		exit 1
		;;
esac

exit 0