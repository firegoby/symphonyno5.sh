# Symphony No.5 Command Line Tool

* Version 0.1.0
* Date: 21st November 2012

## Overview

Symphony No.5 Command Line Tool is a bash script used to easily adminster [Symphony No.5](http://github.com/firegoby/symphonyno5.git) projects from a Unix-y command line.

## Features

* Create and setup new projects
* Update/install Symphony Extensions as git submodules from `extensions.csv`
* Compile & concatenate Coffeescript & Javascript files to a single minified production file
* Compile Less CSS files into single compressed production file
* Cleanup files after installation
* Set directory & file permissions for the project

## Installation

1. Copy `symphonyno5.sh` to a directory in your `$PATH`
2. Run `chmod +x symphonyno5.sh` to make it executable
3. Optional - Create a symlink to reference it by a different name
    `ln -s symphonyno5.sh symphonyno5`

## Usage

### Create a new project

   `symphonyno5.sh new projectname`

### Update/install Symphony Extensions from `extensions.csv`

    ` symphonyno5.sh submodules`

### Compile Coffescript & Javascript

    `symphonyno5.sh compile scripts`

### Compile Less CSS

    `symphonyno5.sh compile styles`

### Run post installatin cleanup

    `symphonyno5.sh postinstall`

### Set directory & file permissions

    `symphonyno5.sh fixperms 0775 0664`


## Changelog

* 0.1.0 - 21 Nov 12 - Initial release
