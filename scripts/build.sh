#!/bin/sh

set -e

export PYTHONPATH=/usr/lib/python2.7
export GYP_DEFINES="linux_use_gold_flags=0"

TARBALL=$(ls / | grep '\.tar\.gz')

if [[ -d /bundle ]]; then
  echo "Using bundle directory"

elif [[ -f $TARBALL ]]; then
  echo "Using bundle tarball"
  tar xzf $TARBALL
  rm $TARBALL

else
   echo "Application bundle not provided"
   exit 1
fi

cd /bundle/programs/server
npm install
