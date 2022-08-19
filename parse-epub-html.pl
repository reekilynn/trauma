#!/usr/bin/perl

## how to use
## perl parse_epub_html.pl <inputfile.xhtml> <output file.txt>

($in,$out) = @ARGV;

open IN, "<$in" || die $!;
open OUT, ">$out" || die $!;

while(<IN>){
    $line = $_;
    chomp $line;
    if($line =~ /<p>.*?<\/p>/){
        $line =~ s/<rb>(.*?)<\/rb><rt>(.*?)<\/rt>/$1（$2）/g;
        $line =~ s/<ruby>(.*?)<\/ruby>/$1/g;
        $line =~ s/<br \/>//g;
        $line =~ s/<span class="tcy">(.*?)<\/span>/$1/g;
        $line =~ s/<span class="em-sesame">(.*?)<\/span>/\*\*$1\*\*/g;
        $line =~ s/<p>(.*?)<\/p>/$1/g;
        print OUT "#".$line."\n";
        print OUT "\n";
    }
}

close OUT;
close IN;
