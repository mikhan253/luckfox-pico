#!/bin/sh
cd sysdrv/source/buildroot/buildroot-2025.08/
rm -rf output/target
find output/ -name ".stamp_target_installed" -delete
rm -f output/build/host-gcc-final-*/.stamp_host_installed
cd ../../../..
