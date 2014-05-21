arken.io
========

The website for Arken. This website is built using [Hugo](http://hugo.spf13.com/), a static site generator written in Go.

To modify the home page you can directly edit `layouts/index.html`.

The content of the documentation site is added as markdown file in the content folder.

If you want to modify the doc introduction, you need to modify `content/doc/introduction.md`.

If you want to add a new page to the architecture menu, please add a new MD file into `content/architecture/`. Make sure you fill the Front metadatas accordingly.

Each time you push changes to the master branch, a [Jenkins job](http://qa.nuxeo.org/jenkins/job/arken.io-update) automatically update the `gh-pages` branch containing the static web site.
