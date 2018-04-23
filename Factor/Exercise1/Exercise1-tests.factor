! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test Exercise1 sequences math.functions ;
IN: Exercise1.tests

[ t ] [ { 0 } 0 pack sequence= ] unit-test
[ t ] [ { 96 } 96 pack sequence= ] unit-test
[ f ] [ { 96 } 0 pack sequence= ] unit-test
[ f ] [ { 0 } 96 pack sequence= ] unit-test

[ 2 ] [ { 1 2 3 } mean ] unit-test
[ 2 ] [ { 3 2 1 } mean ] unit-test
[ 20 ] [ { 20 20 20 20 20 } mean ] unit-test

[ [ sum pack ] ] [ "sum" ?op ] unit-test
[ [ product pack ] ] [ "product" ?op ] unit-test
[ [ mean pack ] ] [ "mean" ?op ] unit-test
[ [ [ sqrt ] map ] ] [ "sqrt" ?op ] unit-test
[ [ f ] ] [ "fsfsdfsdfsd" ?op ] unit-test

{ { 1 2 3 } "sum" } [ { "sum" "1" "2" "3" } split-args ] unit-test
{ { } "abc" } [ { "abc" } split-args ] unit-test
[ { } f ] [ { } split-args ] unit-test
[ { } f ] [ f split-args ] unit-test