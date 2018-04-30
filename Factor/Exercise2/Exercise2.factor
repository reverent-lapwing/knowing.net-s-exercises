! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math.order math sequences combinators io ;
IN: Exercise2

ERROR: invalid-input x ;

: even-check ( n -- n ) dup length 2 mod 0 = [ "Array legth must be even!" invalid-input ] unless ;
: empty-check ( seq -- seq ) dup length 0 = [ "Input array cannot be empty!" invalid-input ] unless ;

: 2avg ( seq -- n ) 2 head sum 2 / ;
: 2dev ( seq -- n ) [ first ] [ 2avg ] bi - abs ;

! : bin-comb ( quot: ( seq -- seq ) seq -- seq ) { 
!    { [ dup length 2 < ] [ drop { } ] }
!    [ swap [ 2 tail bin-comb ] 2bi prefix ]
! } cond ; 

: avg-seq ( seq -- seq ) { 
    { [ dup length 2 < ] [ drop { } ] }
    [ [ 2 tail avg-seq ] [ 2avg ] bi prefix ]
} cond ; 


: dev-seq ( seq -- seq ) {
    { [ dup length 2 < ] [ drop { } ] }
    [ [ 2 tail dev-seq ] [ 2dev ] bi prefix ]
} cond ; 

: haar-seq ( seq -- seq ) [ avg-seq ] [ dev-seq ] bi append ;

: main ( -- ) command-line get haar-seq drop ; 

MAIN: main
