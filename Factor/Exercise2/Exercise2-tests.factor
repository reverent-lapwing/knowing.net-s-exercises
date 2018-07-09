! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test Exercise2 kernel math prettyprint sequences ;
IN: Exercise2.tests

[ 1 ] [ { 1 1 } avg ] unit-test 
[ 1 ] [ { 0 2 } avg ] unit-test
[ 5 ] [ { 6+1/2 3+1/2 } avg ] unit-test
[ -1/10 ] [ { 10+00000000000001/100000000000000 -10-20000000000001/100000000000000 } avg ] unit-test
[ { 6.5 3.5 } avg ] must-fail

[ { 1 } ] [ { 1 1 } avg-seq ] unit-test
[ { 1 } ] [ { 0 2 } avg-seq ] unit-test
[ { -1/10 } ] [ { 10+00000000000001/100000000000000 -10-20000000000001/100000000000000 } avg-seq ] unit-test
[ { 6+1/2 5 } ] [ { 8 5 7 3 } avg-seq ] unit-test
[ { 6+1/2 5 } ] [ { 5 8 3 7 } avg-seq ] unit-test
[ { 5 6+1/2 } ] [ { 7 3 5 8 } avg-seq ] unit-test
[ { 1 2 3 4 5 6 7 8 9 10 11  } ] [ { 0 2 3 1 2 4 5 3 4 6 7 5 6 8 10 6 3 15 -30 50 7+1/2 14+1/2 } avg-seq ] unit-test
[ { 0 2 3 1 2 4 5 3 4 6 7 5 6 8 10 6 3 15 -30 50 7.5 14+1/2 } avg-seq ] must-fail

[ 1 ] [ { 2 4 } dev ] unit-test
[ 1 ] [ { 1000+101/10000 1002+101/10000 } dev ] unit-test 
[ 123 ] [ 24243245 [ 2 123 * + ] keep { 0 } 2sequence dev ] unit-test 
[ { 1000.0101 1002.0101 } dev ] must-fail

[ { 0 } ] [ { 1 1 } dev-seq ] unit-test
[ { 1 } ] [ { 0 2 } dev-seq ] unit-test
[ { 1+1/2 2 } ] [ { 8 5 7 3 } dev-seq ] unit-test
[ { 1+1/2 2 } ] [ { 5 8 3 7 } dev-seq ] unit-test
[ { 2 1+1/2 } ] [ { 7 3 5 8 } dev-seq ] unit-test
[ { 1 1 1 1 1 1 1 2 6 30 3+1/2  } ] [ { 0 2 3 1 2 4 5 3 4 6 7 5 6 8 10 6 3 15 -20 40 7+1/2 14+1/2 } dev-seq ] unit-test
[ { 0 2 3 1 2 4 5 3 4 6 7 5 6 8 10 6 3 15 -20 40 7.5 14+1/2 } dev-seq ] must-fail

[ { 6+1/2 1+1/2 } ] [ { 8 5 } haar-seq-step ] unit-test
[ { 6+1/2 5 1+1/2 2 } ] [ { 8 5 7 3 } haar-seq-step ] unit-test

[ { 6+1/2 1+1/2 } ] [ { 8 5 } haar-seq ] unit-test
[ { 5+3/4 1+3/4 3/4 -1/4 } ] [ { 8 5 7 3 } haar-seq ] unit-test
[ { 1 2 3 4 5 } haar-seq ] must-fail
[ { } haar-seq ] must-fail

