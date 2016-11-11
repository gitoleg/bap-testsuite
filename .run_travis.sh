#!/bin/sh

REPO=$TRAVIS_REPO_SLUG
USER=${REPO%/*}
BAP_REPO=https://github.com/$USER/bap

bash -ex .travis-opam.sh
opam pin add bap $BAP_REPO#$TRAVIS_PULL_REQUEST_BRANCH

make check
