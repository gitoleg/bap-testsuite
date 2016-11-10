#!/bin/sh

BAP_BRANCH=fix-llvm-segfault-PR

opam pin add bap https://github.com/BinaryAnalysisPlatform/bap#$BAP_BRANCH

make check
