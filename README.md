magazine-reader
===============

## Install Ruby Version Manager

https://rvm.io/rvm/install/
Windows: http://blog.developwithpassion.com/2012/03/30/installing-rvm-with-cygwin-on-windows/

## Install our Ruby version and set up our gemset

    rvm install ruby-1.9.3-p327 --verify-downloads 1
    rvm use ruby-1.9.3-p327
    rvm gemset create magreader

## Clone the repository and CD into it, then say Yes to RVM

    git clone git@github.com:mpdaugherty/magazine-reader.git
    cd magazine-reader