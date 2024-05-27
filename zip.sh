#!/bin/sh

zipfile="thesis_$(date +"%d-%m-%y_%H:%M").zip"

for file in *; do
    # Not a zip file
    if [ -z $(echo $file | grep '.*\.zip') ]; then
        zip -r $zipfile $file
    fi
done
