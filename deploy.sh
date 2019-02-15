#!/usr/bin/env bash

set -e

mkdir deployment
cd deployment

git clone https://github.com/gw-acm/acm_site

sudo rm -rf /var/www/html/*

sudo cp -r acm_site/* /var/www/html
cd ..
rm -rf deployment/

echo "Site Deployed Successfully!"
