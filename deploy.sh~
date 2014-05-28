#!/bin/sh
HUGO=hugo_0.10_linux_amd64
if [ ! -f ./$HUGO ]; then
  wget -qO- --no-check-certificate https://github.com/spf13/hugo/releases/download/v0.10/$HUGO.tar.gz \
  | tar -zxp --strip-components=1 $HUGO/$HUGO
fi
./$HUGO
git pull
rm -rf /tmp/static-arken.io
mv public /tmp/static-arken.io
git checkout -f gh-pages
git ls-files -z | xargs -0 rm -f
cp -r /tmp/static-arken.io/* .
echo arken.io >> CNAME
git add -A
git commit -m"Build: ${BUILD_NUMBER} update static site"
git push origin gh-pages
rm -rf /tmp/static-arken.io
