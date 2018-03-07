#!/bin/bash

. latest.sh

vagrant box add --force --name $box_name $box_file
