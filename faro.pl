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
