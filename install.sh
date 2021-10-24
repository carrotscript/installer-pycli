#!/bin/bash
echo 'Installing...'
echo ''
# 1. Create ProgressBar function
# 1.1 Input is currentState($1) and totalState($2)
function ProgressBar {
# Process data
    let _progress=(${1}*100/${2}*100)/100
    let _done=(${_progress}*4)/10
    let _left=40-$_done
# Build progressbar string lengths
    _fill=$(printf "%${_done}s")
    _empty=$(printf "%${_left}s")

# 1.2 Build progressbar strings and print the ProgressBar line
# 1.2.1 Output example:                           
# 1.2.1.1 Progress : [########################################] 100%
printf "\rProgress : [${_fill// /#}${_empty// /-}] ${_progress}%%"

}

# Variables
_start=1

# This accounts as the "totalState" variable for the ProgressBar function
_end=100

# Proof of concept
for number in $(seq ${_start} ${_end})
do
    sleep 0.1
    ProgressBar ${number} ${_end}
done

cd ~
echo 'alias pycli="python3 ~/.pycli.py"' > ~/.bashrc
echo 'alias pycli="python3 ~/.pycli.py"' > ~/.bash_profile
alias pycli="python3 .pycli.py"
source ~/.bashrc 2> /dev/null
source ~/.bash_profile 2> /dev/null
curl -o .pycli.py https://carrotscript.github.io/installer-pycli/pycli.py 2> /dev/null
printf '\nUse the command "pycli" in a new terminal to load the cli\n'
