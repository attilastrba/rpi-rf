#!/bin/bash
counter=1
while [ $counter -le 10 ]
do
  echo $counter
  ((counter++))
  sleep 1
  python3 rpi-rf_send -g 42 -p 316 -t 1 5393
  python3 rpi-rf_send -g 42 -p 316 -t 1 5393
  python3 rpi-rf_send -g 42 -p 316 -t 1 5393
  sleep 1
  python3 rpi-rf_send -g 42 -p 316 -t 1 5396
  python3 rpi-rf_send -g 42 -p 316 -t 1 5396
  python3 rpi-rf_send -g 42 -p 316 -t 1 5396
done

