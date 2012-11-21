#!/bin/bash
usage() {
  scriptname=`basename $0`
  echo "Symphony No.5"
  echo "Usage:"
  echo "Create new project:"
  echo "    $scriptname new projectname"
  echo "Update git submodules from extensions.csv:"
  echo "    $scriptname submodules"
  echo "Compile Coffescript & Javascript into production.min.js:"
  echo "    $scriptname compile scripts"
  echo "Compile Less CSS into compressed main.css:"
  echo "    $scriptname compile styles"
  echo "Cleanup files after installation"
  echo "    $scriptname postinstall"
  echo "Fix directory & file permissions:"
  echo "    $scriptname fixperms 0775 0664"
}

submodules() {
  if [ -e index.php -a -d symphony ]
  then
    filename="extensions.csv"
    if [ -f $filename ] 
    then
      while IFS="," read one two
      do
        git submodule add "$one" "$two"
      done < "$filename"
      git submodule update --init
    else
      echo "Can't find an extensions.csv file, aborting!"
    fi
  else
    echo "It doesn't look like you're in the root directory of a Symphony project! Aborting."
  fi
}

postinstall() {
  if [ -f index.php -a -d symphony ]
  then
    read -p "Do you want to remove the README and LICENSE files? (y/n) " -n 1
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
      echo ""
      echo "Removing README and LICENSE files"
      git rm -q README.* LICENSE.*
    fi
    if [ -f .htaccess ]
    then
      echo "Adding .htaccess to git"
      git add .htaccess
    fi
    echo "Adding manifest.dev/config.php to git"
    git add manifest.dev/config.php
    if [ ! -f manifest.prod/config.php ]
    then
      echo "Copying manifest.dev/config.php to manifest.prod and adding to git"
      cp manifest.dev/config.php manifest.prod/config.php
      git add manifest.prod/config.php
    fi
    if [ -d install ]
    then
      echo "Removing installation files"
      git rm -rfq install
    fi
    git commit -m "Post-install: Delete installation files & docs, add .htaccess"
    scriptname=`basename $0`
    echo ""
    echo "Recommend setting your directory & file permissions, for example:"
    echo "   $scriptname fixperms 0775 0664"
    echo "   git commit -am \"Set dir & file permissions to 0775 0664\""
  else
    echo "It doesn't look like you're in the root directory of a Symphony project! Aborting."
  fi
}

compile() {
  if [ -e index.php -a -d symphony ]
  then
    case $1 in
      scripts)
        cd workspace/scripts/build
        ant;;
      styles)
        lessc --compress workspace/styles.less > workspace/styles/main.css
        echo "Compiled Less CSS main.less into compressed main.css";;
      *)
        echo "Didn't understand '$1', available options are 'scripts' and 'styles'";;
    esac
  fi
}

fixperms() {
  if [ -e index.php -a -d symphony ]
  then
    echo "Setting directory permissions to $1"
    find . -type d -exec chmod $1 {} \;
    echo "Setting file permissions to $2"
    find . -type f -exec chmod $2 {} \;
    echo "Reverting any changes made to git submodules"
    git submodule foreach git checkout -- .
  else
    echo "It doesn't look like you're in the root directory of a Symphony project! Aborting."
  fi
}

new(){
  project="$1"
  echo "Creating new Symphony: $project"
  git clone -b 0.6.0 --depth 1 git://github.com/firegoby/symphonyno5.git $project
  cd $project
  echo "Removing Symphony No.5 git history"
  rm -rf .git
  echo "Loosening file permissions for install"
  chmod -R 777 .
  echo "Creating fresh git repository"
  git init
  #echo "Adding Symphony CMS git repository as remote"
  #git remote add --no-tags -t master symphony git://github.com/symphonycms/symphony-2.git
  echo "Adding Project files for initial commit"
  git add .
  echo "Cloning extensions and extras as git submodules from extensions.csv"
  submodules
  echo "Creating manifest symlink to manifest.dev folder"
  ln -s manifest.dev manifest
  echo "Creating initial commit"
  git commit -m "Initial commit"
  echo "Creating develop git branch from master"
  git checkout -b develop
  scriptname=`basename $0`
  echo "*********************************"
  echo ""
  echo "Your new Symphony '$project' has been created!"
  echo ""
  echo "Next steps:"
  echo "    cd $project"
  echo "    Setup your MySQL database"
  echo "    Setup you web server"
  echo "    Open http://yourdomain.com/install in your browser..."
  echo "    $scriptname postinstall"
  echo ""
  echo "*** Start writing your Symphony ***"
}

cmd=$1
case $cmd in
        new) new $2;;
 submodules) submodules;;
postinstall) postinstall;;
    compile) compile $2;;
   fixperms) fixperms $2 $3;;
          *) usage
esac

