#!/bin/bash
# Generate js from elm files

# Create js file 
elm make src/Main.elm  --debug  --output=dist/js/main.js