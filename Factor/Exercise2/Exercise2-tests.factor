! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test Exercise2 kernel math prettyprint sequences ;
IN: Exercise2.tests

[ 1 ] [ { 1 1 } 2 avg dup . ] unit-test 
[ 1 ] [ { 0 2 } 2 avg dup . ] unit-test
[ 5 ] [ { 6+1/2 3+1/2 } 2 avg dup . ] unit-test
[ -1/10 ] [ { 10+00000000000001/100000000000000 -10-20000000000001/100000000000000 } 2 avg dup . ] unit-test
[ { 6.5 3.5 } 2 avg dup . ] must-fail

[ { 1 } ] [ { 1 1 } avg-seq dup . ] unit-test
[ { 1 } ] [ { 0 2 } avg-seq dup . ] unit-test
[ { -1/10 } ] [ { 10+00000000000001/100000000000000 -10-20000000000001/100000000000000 } avg-seq dup . ] unit-test
[ { 6+1/2 5 } ] [ { 8 5 7 3 } avg-seq dup . ] unit-test
[ { 6+1/2 5 } ] [ { 5 8 3 7 } avg-seq dup . ] unit-test
[ { 5 6+1/2 } ] [ { 7 3 5 8 } avg-seq dup . ] unit-test
[ { 1 2 3 4 5 6 7 8 9 10 11  } ] [ { 0 2 3 1 2 4 5 3 4 6 7 5 6 8 10 6 3 15 -30 50 7+1/2 14+1/2 } avg-seq dup . ] unit-test
[ { 0 2 3 1 2 4 5 3 4 6 7 5 6 8 10 6 3 15 -30 50 7.5 14+1/2 } avg-seq dup . ] must-fail

[ 1 ] [ { 2 4 } 2 dev dup . ] unit-test
[ 1 ] [ { 1000+101/10000 1002+101/10000 } 2 dev dup . ] unit-test 
[ 123 ] [ 24243245 [ 2 123 * + ] keep { 0 } 2sequence 2 dev dup . ] unit-test 
[ { 1000.0101 1002.0101 } 2 dev dup . ] must-fail

[ { 0 } ] [ { 1 1 } dev-seq dup . ] unit-test
[ { 1 } ] [ { 0 2 } dev-seq dup . ] unit-test
[ { 1+1/2 2 } ] [ { 8 5 7 3 } dev-seq dup . ] unit-test
[ { 1+1/2 2 } ] [ { 5 8 3 7 } dev-seq dup . ] unit-test
[ { 2 1+1/2 } ] [ { 7 3 5 8 } dev-seq dup . ] unit-test
[ { 1 1 1 1 1 1 1 2 6 30 3+1/2  } ] [ { 0 2 3 1 2 4 5 3 4 6 7 5 6 8 10 6 3 15 -20 40 7+1/2 14+1/2 } dev-seq dup . ] unit-test
[ { 0 2 3 1 2 4 5 3 4 6 7 5 6 8 10 6 3 15 -20 40 7.5 14+1/2 } dev-seq dup . ] must-fail

[ { 6+1/2 1+1/2 } ] [ { 8 5 } haar-seq-step dup . ] unit-test
[ { 6+1/2 5 1+1/2 2 } ] [ { 8 5 7 3 } haar-seq-step dup . ] unit-test
[ { 1 2 3 4 5 } haar-seq-step dup . ] must-fail
[ { } haar-seq-step dup . ] must-fail
