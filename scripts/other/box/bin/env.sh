#!/bin/bash

export box_name=box_name
export today=`date +%Y.%m.%d`
export now=`date +%Y.%m.%d-%H.%M`
export box_file=$box_name-$now.box

cat <<HERE > latest.sh
export box_name=$box_name
export today=$today
export now=$now
export box_file=$box_file
HERE

