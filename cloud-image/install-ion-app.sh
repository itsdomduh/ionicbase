#!/bin/bash

ErrHandler () {
    echo "initscript failed with error code $? while $step"
    exit 1
}

trap ErrHandler ERR
step="initializing"
echo $step

projectsDir="/projects"
appDir="/projects/vittler-mobileapp"

step="checking projects directory"
echo $step
if [ -e "$projectsDir" ] && ! [ -d "$projectsDir" ]
then
    echo install script error: $projectsDir already exists but is not a directory.
    exit 1
fi

if ! [ -e "$projectsDir" ]
then
    step="creating projects directory"
    echo $step
    mkdir $projectsDir
fi

step="checking app directory"
echo $step
if [ -e "$appDir" ] # does appDir exist?
then
    echo install script error: $appDir already exists.
    exit 1
fi

step="installing app"
echo $step

# cordova plugin add cordova-plugin-geolocation && \
#    cordova plugin add cordova-plugin-compat && \ 
#    cordova plugin add cordova-plugin-facebook4 && \ 
#    cordova plugin add cordova-plugin-facebook4 --save --variable APP_ID="1694727730788884" --variable APP_NAME="Vittler" && \
#    cordova plugin add cordova-plugin-mauron85-background-geolocation
git clone http://itsdom.tech/root/vittler-mobileapp.git && \
    cd vittler-mobileapp && \
     && \ npm install
