# Symphony No.5 Command Line Tool

* Version 0.2.0
* Date: 24th November 2012

## Overview

Symphony No.5 Command Line Tool is a bash script used to easily adminster [Symphony No.5](http://github.com/firegoby/symphonyno5.git) projects from a Unix-y command line.

## Features

* Create and setup new projects
* Update/install Symphony Extensions as git submodules from `extensions.csv`
* Compile & concatenate Coffeescript & Javascript files to a single minified production file
* Compile CSS files into single compressed production file (Less, Sass & Stylus support)
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

### Compile all assets to single minifed production file and update `master.xsl`

    symphonyno5 compile

### Compile just Coffescript & Javascript

    symphonyno5 compile scripts

### Compile just Less, Sass or Stylus Stylesheets

    symphonyno5 compile styles

### Set directory & file permissions

    symphonyno5 setperms 0775 0664

### Fix directory & file permissions to those set in `manifest/config.php`

    symphonyno5 fixperms

## Changelog

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
