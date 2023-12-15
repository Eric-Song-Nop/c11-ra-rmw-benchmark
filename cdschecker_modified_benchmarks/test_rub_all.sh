#!/bin/bash
set -e
set -u

# Paul: skip `spsc-queue` as it deadlocks.

echo "** Test CDSChecker data structure benchmarks **"
for t in barrier chase-lev-deque dekker-fences linuxrwlocks mcs-lock mpmc-queue ms-queue spsc-queue; do
# for t in mcs-lock mpmc-queue ms-queue spsc-queue; do
  cd $t
  echo -n "$t " 
  ../test_rub.sh ./$t
  cd ..
done

