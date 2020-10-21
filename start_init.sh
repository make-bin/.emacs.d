#!/bin/bash

git clone git@github.com:ycm-core/ycmd.git
cd ycmd
git submodule update --init --recursive
./build.py --go-completer
