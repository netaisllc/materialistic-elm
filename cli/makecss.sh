#!/bin/bash
# Generate css from less files

# Remove existing css file
rm ./dist/css/app.css

# Create css file 
lessc --autoprefix  ./less/app.less  ./dist/css/app.css