#!/bin/sh

java -Dfile.encoding=UTF-8 -jar ~/bin/textidote/textidote.jar --check es --output html main.tex > report.html
