#!/bin/sh

REPO=$TRAVIS_REPO_SLUG
USER=${REPO%/*}

BAP_REPO=git://github.com/$USER/bap
PIN_REPO=$BAP_REPO#$TRAVIS_PULL_REQUEST_BRANCH

bash -ex .travis-opam.sh
eval `opam config env`
opam pin add bap $BAP_REPO#$TRAVIS_PULL_REQUEST_BRANCH
make check
