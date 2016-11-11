#!/bin/sh

bash -ex .travis-opam.sh
echo $TRAVIS_PULL_REQUEST_BRANCH
#opam pin add bap https://github.com/BinaryAnalysisPlatform/bap#$BAP_BRANCH


