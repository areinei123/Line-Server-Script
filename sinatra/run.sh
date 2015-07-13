#!/bin/bash
response=$(curl -sb -H --raw "http://localhost:4567/lines/1")
echo $response
response=$(curl -sb -H --raw "http://localhost:4567/lines/2")
echo $response
response=$(curl -sb -H --raw "http://localhost:4567/lines/100")
echo $response
response=$(curl -sb -H --raw "http://localhost:4567/lines/150")
echo $response
response=$(curl -sb -H --raw "http://localhost:4567/lines/500")
echo $response
response=$(curl -sb -H --raw "http://localhost:4567/lines/1000")
echo $response
response=$(curl -sb -H --raw "http://localhost:4567/lines/10000")
echo $response
response=$(curl -sb -H --raw "http://localhost:4567/lines/100000000")
echo $response
