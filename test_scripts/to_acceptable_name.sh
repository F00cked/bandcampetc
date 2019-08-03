#! /usr/bin/env bash

# Meant to be sourced from run_tests.sh.

readonly THE_SCRIPT=bin/to_acceptable_name

unset -v _params
# Input Output
# Input Output
# …
_params=(
    'a b'       a_b
    'a   b'     a_b
    'a/b'       a_b
    'a: b'      a_-_b
    $'a"b?c\nd' abcd
    "a'b#c"     a_b_c
    'a, b; c'   a_b_c
    'a~b'       a-b
    "a"'!'"b"   a_b
    
    AbCdEfGhI8K abcdefghi8k
    
    ðþ                      dth
    'Волшебство Природы'    volsebstvo_prirody
    œæŒÆ                    oeaeoeae
    
    'a%b`c°d'   'a_b_c_d'
    
    'a (b) c'   'a_b_c'
    'a [b] c'   'a_b_c'
    'a {b} c'   'a_b_c'
    
    'a @ b'     a_at_b
    
    'a 12.3$ b' a_12.3_dollars_b
    'a $12.3 b' a_12.3_dollars_b
    'a $ b'     a_dollars_b
    'a$ b'      adollars_b
    
    'a 12.3€ b' a_12.3_euros_b
    'a €12.3 b' a_12.3_euros_b
    'a € b'     a_euros_b
    'a€ b'      aeuros_b
    
    'a 12.3¥ b' a_12.3_yens_b
    'a ¥12.3 b' a_12.3_yens_b
    'a ¥ b'     a_yens_b
    'a¥ b'      ayens_b
    
    'a 12.3円 b' a_12.3_yens_b
    'a 円12.3 b' a_12.3_yens_b
    'a 円 b'     a_yens_b
    'a円 b'      ayens_b
    
    a.-.b-.-c__-_d  a.-.b-.-c_-_d
    a_________b     a_b
    'a__ ____ _b'   a_b
    
    foo_.txt    foo.txt
    bar___.o    bar.o
    _foo.txt    foo.txt
    ___bar.o    bar.o
    foo.txt__   foo.txt
    bar____     bar
    
    'foo .txt'  foo.txt
    'bar   .o'  bar.o
    ' foo.txt'  foo.txt
    '   bar.o'  bar.o
    'foo.txt  ' foo.txt
    'bar    '   bar
    
    .foo    _.foo
    ...bar  _...bar
    
    a…b     a...b
    'a… b'  a..._b
    'a …b'  a_...b
    …a      _...a
    …...a   _......a
    
    ''          _
    ' '         _
    '   '       _
    $'_\n \t_'  _
    
    123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345
    
    1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345
    
    123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345. 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234.
    
    123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345.c 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123.c
    
    123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345.gz 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012.gz
    
    123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345.mp3 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901.mp3
    
    123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345.flac 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890.flac
    
    123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345.lsils 123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789.lsils
    
    123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345.jrujru 12345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678.jrujru
    
    123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345.torrent 1234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789012345678901234567.torrent
)

for ((i = 0;  i < ${#_params[@]} - 1;  i += 2))
do
    : $((i / 2))
    _inp=${_params[i]}
    _out=${_params[i + 1]}
    
    if [ "$("$THE_SCRIPT" <<< "$_inp")" != "$_out" ]
    then
        exit 1
    fi
done
