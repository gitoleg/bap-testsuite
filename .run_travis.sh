#!/bin/sh

bash -ex .travis-opam.sh
eval `opam config env`

BAPDIR=bap-source
USER=${TRAVIS_REPO_SLUG%/*}
PR_NUM=${TRAVIS_PULL_REQUEST_BRANCH##*#}
BRANCH=+refs/pull/$PR_NUM/merge

USER=BinaryAnalysisPlatform

git clone --depth=50 https://github.com/$USER/bap.git $BAPDIR
cd $BAPDIR
echo $PWD
git fetch origin $BRANCH
git checkout -qf FETCH_HEAD
git checkout -b run-travis
opam pin -yn add bap .
opam install bap --deps-only
opam install bap -v

echo "bap installed!"
cd ../
echo $PWD
make check
