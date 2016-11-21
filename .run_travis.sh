#!/bin/sh

bash -ex .travis-opam.sh
eval `opam config env`

BAPDIR=bap-source
USER=${TRAVIS_REPO_SLUG%/*}
PR_NUM=${TRAVIS_PULL_REQUEST_BRANCH##*#}
BRANCH=+refs/pull/$PR_NUM/merge

git clone --depth=50 https://github.com/$USER/bap.git $BAPDIR
cd $BAPDIR
git fetch origin $BRANCH
git checkout -qf FETCH_HEAD
opam pin -yn add bap .
opam install bap --deps-only
opam install bap -v

cd ../

bap bin/arm-linux-gnueabihf-echo -d

make check

if [ $? -ne 0 ] ; then
    echo "testrun.log";
    cat testrun.log;
    echo "testrun.sum";
    cat testrun.sum;
fi
