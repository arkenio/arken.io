#!/bin/sh
if [ ! -f ./hugo ]; then
  wget https://github.com/spf13/hugo/releases/download/v0.10/hugo_0.10_linux_amd64.tar.gz -O-| tar -xvf
  mv ./hugo_0.10_linux_amd64/hugo_0.10_linux_amd64 ./hugo
  rm -r hugo_0.10_linux_amd64/ hugo_0.10_linux_amd64.tar.gz
fi
./hugo
rm -rf /tmp/static-arken.io
mv public /tmp/static-arken.io
git checkout -f gh-pages
git rm --cached -r .
git clean -fd
cp -r /tmp/static-arken.io/* .
echo arken.io >> CNAME
git add -A
git commit -m"Build: ${BUILD_NUMBER} update static site"
git push origin gh-pages
rm -rf /tmp/static-arken.io
