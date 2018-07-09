! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: kernel math.order math.functions math sequences combinators io fry command-line namespaces typed continuations debugger ;
IN: Exercise2

ERROR: invalid-input x ;
ERROR: internal-error x ;

: even-check ( seq -- ) length 2 mod 0 = [ "Array length must be even!" invalid-input ] unless ;
: empty-check ( seq -- ) length 0 > [ "Input array cannot be empty!" invalid-input ] unless ;

: rational-check ( n -- ) rational? [ "All numbers must be rational!" internal-error ] unless ;  
: rational-check-seq ( seq -- ) [ rational-check ] each ;

: avg ( seq -- n )
    dup rational-check-seq
    [ sum ] [ length ] bi /
;

: dev ( seq -- n )
    [ avg '[ _ - abs ] ]
    [ swap map ] bi
    avg
;

: split-by ( seq n -- seq_seq )
    over length over <
    [ 2drop { } ]
    [ [ head { } 1sequence ]
      [ [ tail ]
        [ split-by ] bi
        append
      ] 2bi
    ] if
;

: avg-seq ( seq -- seq ) 2 split-by [ avg ] map ;
: dev-seq ( seq -- seq ) 2 split-by [ dev ] map ;

: haar-seq-step ( seq -- seq ) 
    [ avg-seq ] [ dev-seq ] bi
    append ;

: haar-seq? ( avg seq -- ? )
    first =
;

: haar-seq ( seq -- seq ) 
    [ avg ] keep
    [ 2dup haar-seq? ] [ haar-seq-step ] until
    nip
;

: main ( -- ) [
    command-line get
    { [ even-check ]
      [ empty-check ]
      [ rational-check-seq ]
      [ haar-seq ]
    } cleave
    [ print ] each ]
    [ print-error ] recover
;

MAIN: main
