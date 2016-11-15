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

./configure "--prefix=/home/travis/.opam/system" --with-cxx=`which clang++` "--mandir=$HOME/.opam/system/man" "--enable-everything" "--enable-tests" "--disable-ida" "--disable-fsi-benchmark" "--disable-objdump" 
make
make install

cd ../..
make check
