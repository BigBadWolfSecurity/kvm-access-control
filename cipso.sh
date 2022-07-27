#! /bin/bash

# https://paulmoore.livejournal.com/7234.html

netlabelctl cipsov4 del doi:1
#netlabelctl cipsov4 del doi:2
#netlabelctl cipsov4 add pass doi:1 tags:1
netlabelctl cipsov4 add local doi:1

netlabelctl map del default
netlabelctl map add default address:0.0.0.0/0 protocol:unlbl  
netlabelctl map add default address:::/0 protocol:unlbl
netlabelctl map add default address:127.0.0.1 protocol:cipsov4,1
netlabelctl map add default address:192.168.5.3 protocol:cipsov4,1