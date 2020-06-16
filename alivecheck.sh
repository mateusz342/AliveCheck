#!/bin/bash
for protocol in 'http://' 'https://';do
	while read line;
	do 
		code=$(curl -L --write-out "%{http_code}\n" --output /dev/null --silent --insecure $protocol$line)
		if [ $code = "000" ]; then
			echo "$protocol$line: not responding."
		else
			echo "$protocol$line: HTTP $code"
			echo "$protocol$line: $code" >> alive.txt
		fi		
	done < domains.txt
done
