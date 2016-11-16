#!/bin/sh

bash -ex .travis-opam.sh
eval `opam config env`

BAPDIR=bap-source
PR_NUM=${TRAVIS_PULL_REQUEST_BRANCH##*#}
BRANCH=+refs/pull/$NUMBER/merge

git clone --depth=50 https://github.com/BinaryAnalysisPlatform/bap.git $BAPDIR
cd $BAPDIR
git fetch origin $BRANCH
git checkout -qf FETCH_HEAD
git checkout -b run-travis
opam pin -yn add bap $PWD
opam install bap --deps-only
opam install bap -v

cd ..
make check
