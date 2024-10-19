#! /bin/bash

# CAVEAT: Before running this script, make sure that everything is checked in (stuff will)
#         get overwritten otherwise.
#
# ABOUT THIS SCRIPT:
# Because GitHub pages excludes ruby plugins in the _plugins
# folder because of security restrictions, to publish GitHub pages, you'll 
# need to run this script. Taken from this website:
# https://davecompton.net/2018/12/13/building-jekyll-site-locally-to-be-displayed-on-github.html
# Note that GitHub pages will need to point to gh-pages with the /docs
# folder selected.

# -- Build with no baseurl
bundle exec jekyll build 

# -- Get rid of any existing local gh-pages
git branch -D gh-pages

# -- Create a new gh-pages branch not based on any existing branch
git checkout --orphan gh-pages 

# -- Delete the junk that git puts into this new branch 
# -- ( see git-checkout --orphan documentation for details. )
git rm -rf .

# -- add, commit, and push contents from _site to gh-pages branch.
git --work-tree _site/ add . 
git --work-tree _site/ commit -m 'gh-pages commit' .
git --work-tree _site/ push -f origin gh-pages

## -- go back to working on main branch and clean up.
git checkout -f main
git branch -D gh-pages
rm -rf _site