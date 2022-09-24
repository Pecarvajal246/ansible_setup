#!/bin/bash
while :
do
nc -l -p 1337 | xclip -selection c
streams.sh &
done
