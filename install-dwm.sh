#!/bin/sh

dir_dwm="~/Dwm"
dir_workspace="~/Workspace"
file_config="{$dir_workspace}/config.h"

if [ ! -d $dir_dwm ]
then
  mkdir $dir_dwm
fi;

cd $dir_dwm && apt-get source dwm && cd dwm-* && cp $file_config .
