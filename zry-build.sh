#!/usr/bin/bash

T_ARCH=arm
T_CROSS_COMPILE=arm-linux-gnueabihf-
T_PARALLELS=-j16

echo "Build shell script by ZRY."
echo "ARCH: " $T_ARCH
echo "CROSS_COMPILE_PREFIX: " $T_CROSS_COMPILE
echo "Action: "$1
echo "=========================="

build(){
	time make $T_PARALLELS ARCH=$T_ARCH CROSS_COMPILE=$T_CROSS_COMPILE 2>&1 | tee make.log
}

menuconfig(){
	make menuconfig ARCH=$T_ARCH CROSS_COMPILE=$T_CROSS_COMPILE
}

clean(){
	make clean ARCH=$T_ARCH CROSS_COMPILE=$T_CROSS_COMPILE
}

help(){
	echo "Usage: ./zry-build.sh <command>"
	echo "Commands:"
	echo "	b | build = build target"
	echo "	m | mc | menuconfig = menuconfig"
	echo "	clean = clean"
	echo "	any thing other will print this help"
}

case $1 in
	b|build)
		build
		;;
	m|mc|menuconfig)
		menuconfig
		;;
	clean)
		clean
		;;
	*)
		help
		;;
esac

echo "=========================="

