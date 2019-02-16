#!/bin/bash
try() {
	expected="$1"
	input="$2"
	./9cc "$input" > tmp.s
	gcc -o tmp tmp.s
	./tmp
	actual="$?"

	if [ "$actual" = "$expected" ]; then
		echo "$input => $actual"
	else
		echo "$expected expected, but got $actual"
		exit 1
	fi
}
try 0 0
try 42 42
try 21 '5+20-4'
try 10 '3+8-1'
try 40 "10 + 13 + 20 - 3"
try 36 "1 + 2 + 3+4 + 5 + 6 + 7 + 8"
echo ok
