! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: command-line namespaces sequences kernel math math.functions  math.parser io combinators ;
IN: Exercise1

: pack ( obj -- seq ) { 0 } 1sequence ;

: mean ( seq -- num ) [ sum ] [ length ] bi / ;

: ?op ( string -- quot: ( seq -- seq ) ) {
    { "sum" [ [ sum pack ] ] }
    { "product" [ [ product pack ] ] }
    { "mean" [ [ mean pack ] ] }
    { "sqrt" [ [ [ sqrt ] map ] ] }
    [ drop  "Invalid input; try again." print [ f ] ]
} case ;

: split-args ( seq -- seq string ) [ 1 tail [ string>number ] map ] [ first ] bi ;

: calculate ( -- ) command-line get split-args ?op call( seq -- seq ) [ number>string print ] each ;

MAIN: calculate