#!/bin/bash

. bin/env.sh

echo preparing to export $box_name for $now

vagrant package --output $box_file
cp $box_file $box_name.box

