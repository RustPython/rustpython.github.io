#!/bin/bash

# create directory in case it doesn't exist
mkdir -p ../_data/whats_left

# start a new csv file for modules
echo "module" > ../_data/whats_left/modules.csv

# read the temp file and look for "(entire module)"
# save the output as csv
cat ../_data/whats_left.temp | grep "(entire module)" | cut -d ' ' -f 1 | sort >> ../_data/whats_left/modules.csv
