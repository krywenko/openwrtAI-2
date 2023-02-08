#!/bin/bash

echo "$*" | flite  --setf duration_stretch=1.15  -voice  awb

