! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math.order math.functions math sequences combinators io fry command-line namespaces typed make ;
IN: Exercise2

ERROR: invalid-input x ;
ERROR: internal-error x ;

: even-check ( n -- ) length 2 mod 0 = [ "Array length must be even!" invalid-input ] unless ;
: empty-check ( seq -- ) length 0 > [ "Input array cannot be empty!" invalid-input ] unless ;

: rational-check ( n -- ) rational? [ "All numbers must be rational!" internal-error ] unless ;  
: rational-check-seq ( seq -- ) [ rational-check ] each ;

: avg ( seq -- n )
    dup rational-check-seq
    [ sum ] [ length ] bi /
;

: dev ( seq -- n )
    [ avg '[ _ - ] ]
    [ swap map ] bi
    avg
;

: split-by ( seq n -- seq_seq )
    over length 0 =
    [ 2drop { } ]
    [ [ head ]
      [ [ tail { } 1sequence ]
        [ split-by ] bi
        prefix
      ] 2bi
      
    ] if
;

: avg-seq ( seq -- seq ) 2 split-by [ avg ] map ;
: dev-seq ( seq -- seq ) 2 split-by [ dev ] map ;

: haar-seq-step ( seq -- seq ) 
    dup even-check
    dup empty-check
    [ avg-seq ] [ dev-seq ] bi
    append ;

: haar-seq? ( seq -- ? )
    [ first ] [ avg ] bi =
;

: haar-seq ( seq -- seq ) 
;

: main ( -- ) command-line get drop ; ! haar-seq drop ;

MAIN: main
