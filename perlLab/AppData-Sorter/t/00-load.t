#!perl -T
use 5.006;
use strict;
use warnings;
use Test::More;

plan tests => 1;

BEGIN {
    use_ok( 'AppData::Sorter' ) || print "Bail out!\n";
}

diag( "Testing AppData::Sorter $AppData::Sorter::VERSION, Perl $], $^X" );
