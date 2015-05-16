#!/bin/bash

PWD=`dirname $0`
REUSEPORT=${REUSEPORT:-1}
MAX_WORKER=${MAX_WORKER:-5}

exec carton exec perl -Ilib $PERL_CARTON_PATH/bin/plackup -E production -s Starlet --reuseport=$REUSEPORT --max-worker=$MAX_WORKER --max-reqs-per-child=100 --min-reqs-per-child=100 -a $APPROOT/app.psgi
