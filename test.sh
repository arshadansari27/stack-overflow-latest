#!/bin/bash
# javascript 
while true; do
declare -a tags=('sails.js' 'algorithm' 'node.js')
for t in "${tags[@]}"
        do
            RESULT=$(wget -qO- http://stackoverflow.com/feeds/tag\?tagnames\="$t"\&sort\=newest | grep '<title type="text">')
            data=$(echo "$RESULT" | head -n3 | tail -n1)
                if [ -f "./$t.txt" ]
                then 
                    file=$(cat "./$t.txt")
                    if [ "$file" != "$data" ]
                    then
                        echo "New Question in $t : $data"
                        $(echo "$data" > "./$t.txt");
                    fi
                else
                    echo "$t not exists"
                    $(touch "./$t.txt")
                fi
        done
        sleep 600 
done
