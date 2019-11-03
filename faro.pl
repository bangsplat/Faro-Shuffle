#!/usr/bin/perl -w

use strict;
use warnings;

#
# faro.pl
# Faro shuffle operations
#
# Created 2019-11-02
# Modified 2019-11-02
# Version 0.1
#
# version history
# 
# Version 0.1
# first version
#

# constants
my $USPCC = "AS 2S 3S 4S 5S 6S 7S 8S 9S 10S JS QS KS AD 2D 3D 4D 5D 6D 7D 8D 9D 10D JD QD KD KC QC JC 10C 9C 8C 7C 6C 5C 4C 3C 2C AC KH QH JH 10H 9H 8H 7H 6H 5H 4H 3H 2H AH";
my $MPC = "AS 2S 3S 4S 5S 6S 7S 8S 9S 10S JS QS KS AH 2H 3H 4H 5H 6H 7H 8H 9H 10H JH QH KH AC 2C 3C 4C 5C 6C 7C 8C 9C 10C JC QC KC AD 2D 3D 4D 5D 6D 7D 8D 9D 10D JD QD KD";
my $PHOENIX = "AC 2C 3C 4C 5C 6C 7C 8C 9C 10C JC QC KC AD 2D 3D 4D 5D 6D 7D 8D 9D 10D JD QD KD KH QH JH 10H 9H 8H 7H 6H 5H 4H 3H 2H AH KS QS JS 10S 9S 8S 7S 6S 5S 4S 3S 2S AS";

# split command line arguments into two variables
my ( $s1, $s2 ) = @ARGV;

print "DEBUG\n";
print "parameter 1: $s1\n";
print "parameter 2: $s2\n";

print "\n";

print "OUTPUT: " . faro( $s1, $s2 ) . "\n";


sub faro
{
    # split arguments into two variables
    my ( $s1, $s2 ) = @_;
    my $len1 = length( $s1 );
    my $len2 = length( $s2 );
	
	# split the two strings into arrays for character-by-character access
    my @ar1 = split( //, $s1 );
    my @ar2 = split( //, $s2 );

    return( $ar1[0] );
}
