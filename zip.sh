#!/bin/sh

zipfile="tesis-jhonny-lanzuisi_$(date | sed 's/ /_/g').zip"

zip -u "$zipfile" *
