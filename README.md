# fpga.guide

## installation

```
from https://help.github.com/articles/setting-up-your-github-pages-site-locally-with-jekyll/

# install xcode components 
xcode-select --install

# make sure you have ruby
ruby -v
2.3.3

# install jekyll
gem install bundler

# use bundler to install libs
bundle install

# build and run the site
bundle exec jekyll serve --livereload

```


## Adding an algorithm?

 `./new_algo_template.sh ALGO_NAME SUBSECTION`

 IE.  

`./new_algo_template.sh Lyra2z 2k`


