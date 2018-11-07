#!/usr/bin/perl
$seqfile = "$ARGV[0]".".seq";
$in = "$ARGV[0]".".f";
$index = 0;
$count = 0;
@start;
@end;
@score;
$check;

open (RESULT, $in) or die ("Can't open $in");

while ($line=<RESULT>) {

if ($line =~ /DOCTYPE/) {

$check = 1;

}


if ($line=~/<numresidues>(\d+)<\/numresidues>/) {

$seqp = $1;
$res = length($seqp);
#print "\n$lengthp\n"; 

}



if ($line=~ /<segments num="">/) {
$start[$index] = $res-1;
$end[$index] = $res;
$score[$index] = "-";
$index++;
}

if ($line=~/start="(\d+)" end="(\d+)"(.+)score="(.+)" std/){
$start[$index] = $1;
$end[$index] = $2;
$score[$index] = $4;
$index++;
}

if ($line =~ /<\/data>/) {

$check=$check-1;

}

if ($check<0) {

$start[$index] = $res-1;
$end[$index] = $res;
$score[$index] = "-";
$index++;

}




} # end while
close (RESULT);

open (SEQ, $seqfile) or die ("Can't open $seqfile!");
while ($seq=<SEQ>) {
chomp ($seq);
@split = split(//, $seq);
$size = @split;
for ($pos=0; $pos<$size; $pos++) {
$actual = $pos+1;
print "\n";
$aa = $split[$pos];
$s = $start[$count];
$e = $end[$count];
$c = $score[$count];
$sign = $e+1;
if ($actual==$e) {
$count++;
#print "$actual"." $aa"." D";
#print " $c $s $e";
print "$actual $c";
} 
if (($actual<$e) && ($actual>=$s)) {
#print "$actual"." $aa"." D";
#print " $c $s $e";
print "$actual $c";
} 
else {
if ($actual != $e) {
#print "$actual"." $aa"." O";
#print " $c $s $e";
print "$actual -";
}
}
} # end for
} # end while

