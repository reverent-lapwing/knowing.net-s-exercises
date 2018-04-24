! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: command-line namespaces sequences kernel math math.functions math.statistics math.parser io combinators ;
IN: knowing.Factor.Exercise1

: error-msg ( -- ) "Invalid input; try again." print ;

: pack ( obj -- seq ) { 0 } 1sequence ;

: ?op ( seq string -- seq ) over length 0 > [ {
    { "sum" [ sum pack ] }
    { "product" [ product pack ] }
    { "mean" [ mean pack ] }
    { "sqrt" [ [ sqrt ] map ] }
    [ error-msg drop drop f ]
} case ] [ error-msg drop ] if ;

: parse-numbers ( seq -- seq ) [ string>number ] map dup [ f = ] any? [ drop f ] when ;

: split-args ( seq -- seq string ) dup length 0 > [ [ 1 tail parse-numbers ] [ first ] bi ] [ drop { } f ] if ;

: calculate ( seq -- ) split-args ?op [ number>string print ] each ;
 
: main ( -- ) command-line get calculate ;
 
MAIN: main