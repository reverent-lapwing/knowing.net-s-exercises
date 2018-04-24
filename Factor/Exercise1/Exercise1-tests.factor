! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: tools.test Exercise1 sequences math.functions math.statistics kernel fry ;
IN: Exercise1.tests

! [ t ] [ { 96 } 96 pack sequence= ] unit-test
! [ t ] [ { 0 } 0 pack sequence= ] unit-test
! [ f ] [ { 96 } 0 pack sequence= ] unit-test
! [ f ] [ { 0 } 96 pack sequence= ] unit-test
! 
! [ f ] [ f "sum" ?op ] unit-test 
! [ { } ] [ { } "sum" ?op ] unit-test 
! [ { 6 } ] [ { 1 2 3 } "sum" ?op ] unit-test
! [ { 6 } ] [ { 3 2 1 } "sum" ?op ] unit-test
! [ { 120 } ] [ { 20 20 20 20 20 20 } "sum" ?op ] unit-test
! 
! [ f ] [ f "product" ?op ] unit-test
! [ { } ] [ { } "product" ?op ] unit-test
! [ { 6 } ] [ { 1 2 3 } "product" ?op ] unit-test
! [ { 6 } ] [ { 3 2 1 } "product" ?op ] unit-test
! [ { 120 } ] [ { 1 2 3 4 5 } "product" ?op ] unit-test
! [ { 0 } ] [ { 1 2 3 4 5 0 } "product" ?op ] unit-test
! [ { 0 } ] [ { 0 1 2 3 4 5 } "product" ?op ] unit-test
! [ { 0 } ] [ { 1 2 0 3 4 5 } "product" ?op ] unit-test
! 
! [ f ] [ f "mean" ?op ] unit-test
! [ { } ] [ { } "mean" ?op ] unit-test
! [ { 2 } ] [ { 1 2 3 } "mean" ?op ] unit-test
! [ { 2 } ] [ { 3 2 1 } "mean" ?op ] unit-test
! [ { 20 } ] [ { 20 20 20 20 20 20 } "mean" ?op ] unit-test
! 
! [ f ] [ f "sqrt" ?op ] unit-test
! [ { } ] [ { } "sqrt" ?op ] unit-test
! [ { 1.0 2.0 3.0 4.0 5.0 } ] [ { 1 4 9 16 25 } "sqrt" ?op ] unit-test
! [ { 5.0 4.0 3.0 2.0 1.0 } ] [ { 25 16 9 4 1 } "sqrt" ?op ] unit-test
! [ { 0.0 } ] [ { 0 } "sqrt" ?op ] unit-test
! 
! [ f ] [ f "fsfsdfsdfsd" ?op ] unit-test
! [ { } ] [ { } "fsfsdfsdfsd" ?op ] unit-test
! [ f ] [ { 1 2 3 } "fsfsdfsdfsd" ?op ] unit-test
!  
! { { 1 2 3 } "sum" } [ { "sum" "1" "2" "3" } split-args ] unit-test
! { { } "abc" } [ { "abc" } split-args ] unit-test
! [ { } f ] [ { } split-args ] unit-test
! [ { } f ] [ f split-args ] unit-test
! 
! [ ] [ { "sum" } calculate ] unit-test
! [ ] [ { "sum" "1" "2" "3" } calculate ] unit-test
! [ ] [ { "mean" "2" "2" "5" } calculate ] unit-test
! [ ] [ { "product" "sum" "2" "4" "8" } calculate ] unit-test
! [ ] [ { "madeupname" "1" "1" "1" } calculate ] unit-test
! [ ] [ { } calculate ] unit-test
! [ ] [ f calculate ] unit-test