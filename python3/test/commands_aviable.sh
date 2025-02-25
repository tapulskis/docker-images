#!/bin/bash
set -e

CMD="docker run -it --rm $1"

function check_command {
	echo -n "Checking command $1 ... "
	($CMD $1 $2 >/dev/null 2>&1 && echo "OK") \
	|| (echo "MISSING" && exit -1)
}


check_command python3 --version
check_command pip --version
