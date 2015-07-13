#!/bin/bash
find_line=$1
#curl -v 127.0.0.1:4567
curl -v localhost:4567/lines/2
exec ruby server.rb