#!/bin/sh

opam repo add testing git://github.com/BinaryAnalysisPlatform/opam-repository#testing
opam update
opam install -v -y bap-frames bap-veri
