#!/bin/bash

rules_of_arch() {
    if [ "$1" = "x86" ]; then
        rules=x86_qemu
    elif [ "$1" = "x86-64" ]; then
        rules=x86_pin
    elif [ "$1" = "arm" ]; then
        rules=arm_qemu
    else
        echo "unknown arch $1"
        exit 1
    fi
}

for arch in `ls traces`; do
    rules_of_arch $arch

 for f in `ls traces/$arch`; do
     logfile=log/$arch/${f%%.*}
     bap-veri $a --show-stat  --rules=$rules > c
     d=`diff $b $c`
     if [ "$d" != "" ]; then
       R="$R$arch/$f; "
     fi
 done
done

 if [ "$R" != ""  ]; then
     echo "verification failed for $R"
     exit 1
 else
     exit 0
 fi
