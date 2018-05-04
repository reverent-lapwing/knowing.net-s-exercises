! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math.order math.functions math sequences combinators io fry command-line namespaces typed ;
IN: Exercise2

ERROR: invalid-input x ;
ERROR: internal-error x ;

: even-check ( n -- n ) dup length 2 mod 0 = [ "Array legth must be even!" invalid-input ] unless ;
: empty-check ( seq -- seq ) dup length 0 > [ "Input array cannot be empty!" invalid-input ] unless ;

: rational-assert ( n -- n ) dup rational? [ "All numbers must be rational!" internal-error ] unless ;  

: avg ( seq n -- n )
    [ head ]
    [ [ [ rational-assert ] map sum ]
        [ / ] bi*
    ] bi ;

: dev ( seq n -- n ) 
    [ avg ] [ drop first ] 2bi - abs ;

: bin-seq ( seq quot: ( seq -- n ) -- seq ) 
    over length 2 <
    [ 2drop { } ]
    [ [ [ 2 tail ] dip bin-seq ] [ call( seq -- n ) ] 2bi prefix ]
    if ; 

: avg-seq ( seq -- seq ) [ 2 avg ] bin-seq ;
: dev-seq ( seq -- seq ) [ 2 dev ] bin-seq ;

: haar-seq-step ( seq -- seq ) 
    even-check
    empty-check 
    [ avg-seq ] [ dev-seq ] bi
    append ;

: haar-seq? ( seq -- ? )
    [ first ] [ length ] [ swap avg ] tri = ;

: haar-seq ( seq -- seq ) 
;

: main ( -- ) command-line get drop ; ! haar-seq drop ; 

MAIN: main
