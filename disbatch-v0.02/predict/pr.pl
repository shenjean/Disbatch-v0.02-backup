#!/usr/bin/perl

use WWW::Mechanize;

   $uri = "http://prdos.hgc.jp/cgi-bin/top.cgi";
   $file="$ARGV[0]";
   $in="$ARGV[0]".".seq";
   @id;

   open (FILE, $in) or die "pr.pl: Error opening input file $in!";
   
   while ($line=<FILE>) {
   
   $sequence = $line;
   chomp($sequence); 
   #print ($sequence);

    my $mech = WWW::Mechanize->new();
 
    $mech->get($uri);

    $mech->submit_form(
        form_name    => 'prdos_submit',
        fields      => {
        sequence    => $sequence,
        button => 'Predict'
        }
    );
    die unless ($mech->success);

        $mech->submit_form(
        form_number    => '1',
        fields      => {
        button => ' OK '      
        }
    );
    die unless ($mech->success);

    $content = $mech->content();
    $content =~ m/ppid=(.+)\"/;
    $ppid = $1;
    push(@id, $ppid);
    }
    open (LOG, ">$file.prlog.txt");
    foreach (@id) {
    print LOG "$_"."\n";
    }

