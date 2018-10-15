#!/usr/bin/env bash

curl -sL https://deb.nodesource.com/setup_8.x | sudo bash -
sudo apt install -y nodejs

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install -y yarn

mkdir deployment
cd deployment

git clone https://github.com/gw-acm/acm_site
git clone https://github.com/gw-acm/acm_labs_site

cd acm_labs_site
yarn install
yarn build

cp -r build/ ../acm_site/labs
cd ..

sudo rm -rf /var/www/html/*

sudo cp -r acm_site/* /var/www/html
rm -rf deployment
