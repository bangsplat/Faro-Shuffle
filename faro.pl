#!/usr/bin/perl -w

use strict;
use warnings;

#
# faro.pl
# Faro shuffle operations
#
# Created 2019-11-02
# Modified 2019-11-07
# Version 0.1
#
# version history
# 
# Version 0.1
# first version
# 
# Version 0.2
# first working version (at least for out faros)
#
# Version 0.3
# added structure for different shuffle types and support for false shuffles
# 

# constants
my $USPCC = "AS 2S 3S 4S 5S 6S 7S 8S 9S 10S JS QS KS AD 2D 3D 4D 5D 6D 7D 8D 9D 10D JD QD KD KC QC JC 10C 9C 8C 7C 6C 5C 4C 3C 2C AC KH QH JH 10H 9H 8H 7H 6H 5H 4H 3H 2H AH";
my $MPC = "AS 2S 3S 4S 5S 6S 7S 8S 9S 10S JS QS KS AH 2H 3H 4H 5H 6H 7H 8H 9H 10H JH QH KH AC 2C 3C 4C 5C 6C 7C 8C 9C 10C JC QC KC AD 2D 3D 4D 5D 6D 7D 8D 9D 10D JD QD KD";
my $PHOENIX = "AC 2C 3C 4C 5C 6C 7C 8C 9C 10C JC QC KC AD 2D 3D 4D 5D 6D 7D 8D 9D 10D JD QD KD KH QH JH 10H 9H 8H 7H 6H 5H 4H 3H 2H AH KS QS JS 10S 9S 8S 7S 6S 5S 4S 3S 2S AS";
my $MNEMONICA = "9D AH 6C 10D QS 7C QD JS 9C AC 4D 7H 4S AD 10H 7S JC KH 10S 8C JD KS 5C 8D 3H 2C KD 5D 10C 6H 8S 3S JH 2D KC 9H 5S 6S 8H QC 3D QH 2S 9S 5H AS 6D 4H 3C 7D 2H 4C";

my $output;

# split command line arguments into two strings
my ( $s1, $s2 ) = @ARGV;

# look for preset values
if ( !defined( $s1 ) ) { $s1 = $USPCC; }
elsif ( lc $s1 eq "uspcc" ) { $s1 = $USPCC; }
elsif ( lc $s1 eq "mpc" ) { $s1 = $MPC; }
elsif ( lc $s1 eq "phoenix" ) { $s1 = $PHOENIX; }
elsif ( lc $s1 eq "mnemonica" ) { $s1 = $MNEMONICA; }

# if no shuffle sequence is specified, default to a single out faro
if ( !defined ($s2) ) { $s2 = "O"; }

$output = faro( $s1, $s2 );
print "OUTPUT: $output\n";

sub faro
{
    # parse arguments into a list of cards and shuffles
    my ( $s1, $s2 ) = @_;
    my @cards = split( / /, $s1 );
    my @shuffles = split( / /, $s2 );
    my $deck = "@cards";
    
    # for each item in shuffle list, call faro() with the deck string
    for ( my $s = 0; $s < @shuffles; $s++ ){
        $deck = shuffle( $deck, $shuffles[$s] );
    }
    
    return( "$deck" );
}

sub shuffle
{
    my ( $s1, $s2 ) = @_;
    my @cards = split( / /, $s1 );
    my $num_cards = @cards;
    my $last_card = $num_cards - 1;
    my @shuffled_cards;
    my $new_position;
    
    my $shuffle_type = lc ( substr ( $s2, 0, 1 ) );
    
    # step through each card in the deck
    # calculate where it will end up after the shuffle
    # place the card in that location
    
    if ( $shuffle_type eq "o" ) {                           # out faro
        for ( my $i = 0; $i < $num_cards; $i++ ) {
            if ( $i eq $last_card) {                        # last card is a special case
                $shuffled_cards[$last_card] = $cards[$i];
            } else {
                $new_position = $i * 2;                     # calculate new position
                # if new position is beyond the end of the deck, wrap around to correct position
                if ( $new_position > $last_card ) {
                    $new_position -= $last_card;
                }
                # place card into correct position of output
                $shuffled_cards[$new_position] = $cards[$i];
            }
        }
    } elsif ( $shuffle_type eq "i" ){                       # in faro
        ## need to figure out the math on the in faro
        @shuffled_cards = @cards;        
    } else {                                                # false shuffle
        @shuffled_cards = @cards;
    }
    
    return( "@shuffled_cards" );
}
