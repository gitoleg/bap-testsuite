#!/bin/sh

#bash -ex .travis-opam.sh
BRANCH=$TRAVIS_PULL_REQUEST_BRANCH
REPO=$TRAVIS_REPO_SLUG
USER={$REPO%/*}
echo $USER
echo $BRANCH

#opam pin add bap https://github.com/BinaryAnalysisPlatform/bap#$BAP_BRANCH


