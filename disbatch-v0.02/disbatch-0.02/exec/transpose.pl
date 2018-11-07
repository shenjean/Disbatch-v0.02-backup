#!/usr/bin/perl

$index = 1;
$file = $ARGV[0];

open (FILE, $file);

while ($line=<FILE>) {

chomp ($line);

if ($line=~/^1 /) {

$line =~s/ /,/;
print "\n$line,";

}

else {

$line =~s/ /,/;
print "$line,";

}
}
