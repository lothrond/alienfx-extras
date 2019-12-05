alienfx-extras
==============

A few extra things for alienfx.

* autostart
* toggle

### autostart

This sets up keyboard backlight on user login.

### toggle

This sets up a 'toggle' to click on
which changes the keyboard backlight state (on/off).

## Instructions

#### This Makefile is dependent on a normal user under sudo (not su, etc).

You will need to have `` sudo `` installed.

install:

    sudo make install
    
remove:

    sudo make remove

## Updating

First check for, and pull in any new changes:

    git pull
    
If no changes were made, you are done.
If things have been updated, remove all older sources, eg:

    sudo make remove
    
Then, install newer sources, eg:

    sudo make install

