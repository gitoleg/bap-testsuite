#!/bin/sh

BAP_BRANCH=fix-llvm-segfault-PR

bash -ex .travis-opam.sh

opam depext bap
opam pin add bap https://github.com/BinaryAnalysisPlatform/bap#$BAP_BRANCH
opam install bap
