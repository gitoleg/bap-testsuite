#!/bin/sh

#bash -ex .travis-opam.sh
echo "branch: "
echo $TRAVIS_PULL_REQUEST_BRANCH
echo $TRAVIS_REPO_SLUG
#opam pin add bap https://github.com/BinaryAnalysisPlatform/bap#$BAP_BRANCH


