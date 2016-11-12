#!/bin/sh

REPO=$TRAVIS_REPO_SLUG
USER=${REPO%/*}
BAP_REPO=https://github.com/$USER/bap

bash -ex .travis-opam.sh
opam install bap
echo "request version"
runtest --version
echo "version request done"
