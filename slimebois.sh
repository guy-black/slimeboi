#!/bin/bash
#
# slimebois - colorful terminal friends to distract you from the existential dread of life under latestage capitalism
#
## animation variables
## TODO: generate these automatically from a text file and verify all frames are the same size
#### grep for frame end strings
#### let length= line number of first FES
#### verify that there are exactly (length-1) lines of text between each FES, and that the last line is a FES
frames=31;
lines=15;
##get colors a little easier
function setC () { tput setaf "$1";}
##animation logic
## to get a certain line from a certain frame
## first arg is framnum, second is line
function getLine () {
   [ "$1" -le "$frames" ] && sed "$(((((($1-1)) * ((lines+1)))) + $2)) q;d" animation| tr -d '\n'
   [ "$1" -gt "$frames" ] && getLine $(( $1 - frames )) "$2"
}
# given a frame number: clear the screen, render the frame, then show next
function renderFrame () {
   cat <<EOF
$(setC 1)$(getLine "$1" 1)$(setC 2)$(getLine $(($1+5)) 1)$(setC 3)$(getLine $(($1+10)) 1)$(setC 4)$(getLine $(($1+15)) 1)$(setC 5)$(getLine $(($1+30)) 1)$(setC 6)$(getLine $(($1+25)) 1)
$(setC 1)$(getLine "$1" 2)$(setC 2)$(getLine $(($1+5)) 2)$(setC 3)$(getLine $(($1+10)) 2)$(setC 4)$(getLine $(($1+15)) 2)$(setC 5)$(getLine $(($1+30)) 2)$(setC 6)$(getLine $(($1+25)) 2)
$(setC 1)$(getLine "$1" 3)$(setC 2)$(getLine $(($1+5)) 3)$(setC 3)$(getLine $(($1+10)) 3)$(setC 4)$(getLine $(($1+15)) 3)$(setC 5)$(getLine $(($1+30)) 3)$(setC 6)$(getLine $(($1+25)) 3)
$(setC 1)$(getLine "$1" 4)$(setC 2)$(getLine $(($1+5)) 4)$(setC 3)$(getLine $(($1+10)) 4)$(setC 4)$(getLine $(($1+15)) 4)$(setC 5)$(getLine $(($1+30)) 4)$(setC 6)$(getLine $(($1+25)) 4)
$(setC 1)$(getLine "$1" 5)$(setC 2)$(getLine $(($1+5)) 5)$(setC 3)$(getLine $(($1+10)) 5)$(setC 4)$(getLine $(($1+15)) 5)$(setC 5)$(getLine $(($1+30)) 5)$(setC 6)$(getLine $(($1+25)) 5)
$(setC 1)$(getLine "$1" 6)$(setC 2)$(getLine $(($1+5)) 6)$(setC 3)$(getLine $(($1+10)) 6)$(setC 4)$(getLine $(($1+15)) 6)$(setC 5)$(getLine $(($1+30)) 6)$(setC 6)$(getLine $(($1+25)) 6)
$(setC 1)$(getLine "$1" 7)$(setC 2)$(getLine $(($1+5)) 7)$(setC 3)$(getLine $(($1+10)) 7)$(setC 4)$(getLine $(($1+15)) 7)$(setC 5)$(getLine $(($1+30)) 7)$(setC 6)$(getLine $(($1+25)) 7)
$(setC 1)$(getLine "$1" 8)$(setC 2)$(getLine $(($1+5)) 8)$(setC 3)$(getLine $(($1+10)) 8)$(setC 4)$(getLine $(($1+15)) 8)$(setC 5)$(getLine $(($1+30)) 8)$(setC 6)$(getLine $(($1+25)) 8)
$(setC 1)$(getLine "$1" 9)$(setC 2)$(getLine $(($1+5)) 9)$(setC 3)$(getLine $(($1+10)) 9)$(setC 4)$(getLine $(($1+15)) 9)$(setC 5)$(getLine $(($1+30)) 9)$(setC 6)$(getLine $(($1+25)) 9)
$(setC 1)$(getLine "$1" 10)$(setC 2)$(getLine $(($1+5)) 10)$(setC 3)$(getLine $(($1+10)) 10)$(setC 4)$(getLine $(($1+15)) 10)$(setC 5)$(getLine $(($1+30)) 10)$(setC 6)$(getLine $(($1+25)) 10)
$(setC 1)$(getLine "$1" 11)$(setC 2)$(getLine $(($1+5)) 11)$(setC 3)$(getLine $(($1+10)) 11)$(setC 4)$(getLine $(($1+15)) 11)$(setC 5)$(getLine $(($1+30)) 11)$(setC 6)$(getLine $(($1+25)) 11)
$(setC 1)$(getLine "$1" 12)$(setC 2)$(getLine $(($1+5)) 12)$(setC 3)$(getLine $(($1+10)) 12)$(setC 4)$(getLine $(($1+15)) 12)$(setC 5)$(getLine $(($1+30)) 12)$(setC 6)$(getLine $(($1+25)) 12)
$(setC 1)$(getLine "$1" 13)$(setC 2)$(getLine $(($1+5)) 13)$(setC 3)$(getLine $(($1+10)) 13)$(setC 4)$(getLine $(($1+15)) 13)$(setC 5)$(getLine $(($1+30)) 13)$(setC 6)$(getLine $(($1+25)) 13)
$(setC 1)$(getLine "$1" 14)$(setC 2)$(getLine $(($1+5)) 14)$(setC 3)$(getLine $(($1+10)) 14)$(setC 4)$(getLine $(($1+15)) 14)$(setC 5)$(getLine $(($1+30)) 14)$(setC 6)$(getLine $(($1+25)) 14)
$(setC 1)$(getLine "$1" 15)$(setC 2)$(getLine $(($1+5)) 15)$(setC 3)$(getLine $(($1+10)) 15)$(setC 4)$(getLine $(($1+15)) 15)$(setC 5)$(getLine $(($1+30)) 15)$(setC 6)$(getLine $(($1+25)) 15)
EOF
   [ "$1" -ge "$frames" ] && renderFrame 1
   [ "$1" -lt "$frames" ] && renderFrame $(( $1 + 1 ))
}

renderFrame 1
