#!/bin/sh

zipfile="tesis-jhonny-lanzuisi_$(date +"%d-%m-%y_%H:%M").zip"

# clean first
rm *.aux *.bbl *.blg *.out *.xml *.toc *.fmt *.bcf *.log

for file in *; do
    # Not a zip file
    if [ -z $(echo $file | grep '.*\.zip') ]; then
        zip -r $zipfile $file
    fi
done
