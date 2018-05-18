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

if ! [ -e "$projectsDir" ]
then
    echo initscript error: $projectsDir does not exist.
    exit 1
fi
if ! [ -d "$projectsDir" ]
then
    echo initscript error: $projectsDir is not a directory.
    exit 1
fi

if [ -e "$appDir" ] # does appDir exist?
then # appDir exists
    if [ -d "$appDir" ] # is appDir a directory?
    then # appDir is a directory
        step="running previously installed app"
        echo $step
        cd $appDir
        ionic serve
    else # appDir is not a directory
        echo initscript error: $appDir is not a directory.
        exit 1
    fi  # is appDir a directory?
else # appDir does not exist
    step="installing app"
    echo $step
    cd $projectsDir

    # cordova plugin add cordova-plugin-geolocation && \
    #    cordova plugin add cordova-plugin-compat && \ 
    #    cordova plugin add cordova-plugin-facebook4 && \ 
    #    cordova plugin add cordova-plugin-facebook4 --save --variable APP_ID="????????????" --variable APP_NAME="Vittler" && \
    #    cordova plugin add cordova-plugin-mauron85-background-geolocation
    git clone https://VittlerBuild:oilskin_flippant_endless_growl@bitbucket.org/tdproj/vittler-mobileapp.git && \
        cd vittler-mobileapp && \
        npm install
    step="running newly installed app"
    echo $step
    ionic serve  
fi # does appDir exist?
