#!/bin/bash
RANDOM=$$
for((i=0;i<10;i++))
#for i in `seq 9`
do
    echo $i, $RANDOM
done > inputFile



