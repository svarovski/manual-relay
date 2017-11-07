#!/usr/bin/env bash

CMD=$1
URL=$2
LCC="/usr/bin/java -jar /home/gena/ws/chess/livechess/eb-rotate/live-chess-client-demo-3.0.3-SNAPSHOT.jar MULTI_TEST"

if [ $CMD == "start" ]; then
    $LCC << EOT
- Examine m http://localhost:8080/cometd yes 1 201083
- sleep 5000
- examine_feed "" "" ${URL} ""
- sleep 5000
- exit
EOT
fi

if [ $CMD == "stop" ]; then
    $LCC << EOT
- Examine m http://localhost:8080/cometd yes 1 201083
- sleep 5000
- examine_feed "" "" "" ${URL}
- sleep 5000
- exit
EOT
fi

