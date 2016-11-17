#!/bin/sh

bash -ex .travis-opam.sh
eval `opam config env`

BAPDIR=bap-source
PR_NUM=${TRAVIS_PULL_REQUEST_BRANCH##*#}
BRANCH=+refs/pull/$PR_NUM/merge

#git clone --depth=50 https://github.com/BinaryAnalysisPlatform/bap.git $BAPDIR
#cd $BAPDIR
opam pin -yn add https://github.com/BinaryAnalysisPlatform/bap.git
#opam pin -yn add bap git+file://$PWD
opam install bap --deps-only
opam install bap -v

echo "bap installed!"
cd ..
make check
