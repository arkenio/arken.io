#!/bin/sh
if [ ! -f ./hugo ]; then
  wget https://github.com/spf13/hugo/releases/download/v0.10/hugo_0.10_linux_amd64.tar.gz
  tar -xvf  hugo_0.10_linux_amd64.tar.gz
  mv ./hugo_0.10_linux_amd64/hugo_0.10_linux_amd64 ./hugo
  rm -r hugo_0.10_linux_amd64/ hugo_0.10_linux_amd64.tar.gz
fi
./hugo
mv public /tmp/static-arken.io
git checkout gh-pages
git rm --cached -r .
git clean -fd
git commit -m"delete preexisting site"
cp -r  /tmp/static-arken.io/* .
git add *
git commit -m"update static site"
git push
git checkout master
rm -rf /tmp/static-arken.io
