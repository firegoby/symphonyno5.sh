# Symphony No.5 Command Line Tool

* Version 0.1.1
* Date: 22nd November 2012

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

1. Copy `symphonyno5` to a directory in your `$PATH`
2. Run `chmod +x symphonyno5` to make it executable

## Usage

***Note**: All commands other than `new` should be run from a Symphony root directory.*

### Create a new project

    symphonyno5 new projectname

### Update/install Symphony Extensions from `extensions.csv`

    symphonyno5 extensions

### Compile Coffescript & Javascript

    symphonyno5 compile scripts

### Compile Less CSS

    symphonyno5 compile styles

### Run post installatin cleanup

    symphonyno5 postinstall

### Set directory & file permissions

    symphonyno5 fixperms 0775 0664

## Changelog

* 0.1.1 - 22 Nov 12 
  * Drop the `.sh` extension from the script
  * Rename `submodules` command to `extensions`
* 0.1.0 - 21 Nov 12 - Initial release
