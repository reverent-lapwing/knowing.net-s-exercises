! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: command-line namespaces sequences kernel math math.functions math.statistics math.parser io combinators ;
IN: Exercise1

: pack ( obj -- seq ) { 0 } 1sequence ;

: ?op ( seq string -- seq ) {
    { "sum" [ sum pack ] }
    { "product" [ product pack ] }
    { "mean" [ mean pack ] }
    { "sqrt" [ [ sqrt ] map ] }
    [ drop "Invalid input; try again." print ]
} case ;


! : split-args ( seq -- seq string ) dup length 0 > [ [ 1 tail [ string>number ] map ] [ first ] bi ] [ drop { } f ] if ;

! : calculate ( -- ) command-line get split-args ?op [ number>string print ] each ;
: calculate ( -- ) ;

MAIN: calculate