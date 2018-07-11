! Copyright (C) 2018 Your name.
! See http://factorcode.org/license.txt for BSD license.
USING: accessors kernel math.order math.functions math.parser math sequences combinators io fry command-line namespaces typed continuations debugger ;
IN: Exercise2

ERROR: invalid-input err-msg ;
ERROR: internal-error err-msg ;

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

: strings>numbers ( strings -- numbers )
    [ string>number ] map
;

: handle-error ( error -- )
    { { [ dup invalid-input? ] [ err-msg>> print ] }
      { [ dup internal-error? ]
        [ [ err-msg>> print ]
          [ throw-continue ] bi
        ]
      }
      [ throw-continue ]
    } cond
;

: check-input ( seq -- ? )
    [ [ even-check ]
      [ empty-check ]
      [ rational-check-seq ] tri
      t
    ]
    [ handle-error
      drop f
    ] recover
;

: main-impl ( seq -- )
    strings>numbers
    dup check-input
    [ haar-seq [ print ] each ]
    [ drop ] if
;

: main ( -- )
    command-line get main-impl
;

MAIN: main
