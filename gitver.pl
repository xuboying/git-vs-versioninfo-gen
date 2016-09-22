#!/usr/bin/env perl
use strict;
use warnings;
use Getopt::Std;
my %opts;
getopts('p', \%opts);
my $dirty = "";
my @head  = `git diff-index --name-only HEAD --`;
if ($#head >= 0) {
    $dirty = "-dirty";
}
my $r = `git describe --tags`;
chomp $r;
$r .= $dirty;

if (defined $opts{p}) {
    print qq(\$VERSION = '$r';);
}
else {
    print $r;
}
