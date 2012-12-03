# Symphony No.5 Command Line Tool

* Version 0.3.0
* Date: 3rd December 2012

## Overview

Symphony No.5 Command Line Tool is a bash script used to easily adminster [Symphony No.5](http://github.com/firegoby/symphonyno5.git) projects from a Unix-y command line.

## Features

* Create and setup new projects
* Update/install Symphony Extensions as git submodules from `extensions.csv`
* Set directory & file permissions for the project
* Fix directory & file permissions to those set in `manifest/config.php`

## Installation

1. Copy `symphonyno5` to a directory in your `$PATH`
2. Run `chmod +x symphonyno5` to make it executable

## Usage

***Note**: All commands other than `new` should be run from a Symphony CMS root directory.*

### Create a new project

    symphonyno5 new projectname

### Update/install Symphony Extensions from `extensions.csv`

    symphonyno5 extensions

### Set directory & file permissions

    symphonyno5 setperms 0775 0664

### Fix directory & file permissions to those set in `manifest/config.php`

    symphonyno5 fixperms

## Frequently Asked Questions

1. **What happened to all the CSS & Javascript compilation stuff!?**

  It got moved to a dedicated Symphony extension [Asset Compiler](http://github.com/firegoby/asset_compiler) - take a look! If you still need to the old functionality use git to checkout `0.2.0`

## Changelog

* 0.3.0 - 3 Dec 12
  * Removed `compile` commands
* 0.2.0 - 24 Nov 12
  * Remove Ant build script support
  * Compile javascript via Curl API call to Google Closure
  * Retask `fixperms` command
  * Add `setperms` command
  * Add plain `compile` command to compile all assets, CSS & JS
  * Misc refactoring/cleanup of code
* 0.1.1 - 22 Nov 12 
  * Drop the `.sh` extension from the script
  * Rename `submodules` command to `extensions`
* 0.1.0 - 21 Nov 12 - Initial release
