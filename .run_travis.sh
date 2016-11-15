#!/bin/sh

bash -ex .travis-opam.sh
eval `opam config env`
opam install bap --deps-only


NUMBER=${TRAVIS_PULL_REQUEST_BRANCH##*#}
BRANCH=+refs/pull/$NUMBER/merge

git clone --depth=50 https://github.com/BinaryAnalysisPlatform/bap.git BinaryAnalysisPlatform/bap
cd BinaryAnalysisPlatform/bap
git fetch origin $BRANCH
git checkout -qf FETCH_HEAD
git checkout -b run-travis
opam pin -yn add bap file://$PWD#run-travis
opam install bap --deps-only
opan install bap -v

cd ../..
make check
