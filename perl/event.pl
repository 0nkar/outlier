#!/usr/bin/perl
my $file = shift or die "Usage: $0 filename\n";
open(my $fh, "<", $file) or die "Cannot open file: $!\n";
my (%counts, %latest);
while(<$fh>){
	chomp;
	if(/^(\S+\s+\S+)\s+(ERROR|WARNING|INFO)\s+(.*)$/){
		my ($ts, $lvl, $msg) = ($1, $2, $3);
		$counts{$lvl}++;
		if(!defined $latest{$lvl} or $ts gt $latest{$lvl}{timestamp}){
			$latest{$lvl} = { timestamp => $ts, message => "$lvl $msg" };
		}
	}
}
close($fh);
print "INFO: ", ($counts{'INFO'} || 0), " occurrences\n";
print "ERROR: ", ($counts{'ERROR'} || 0), " occurrences\n";
print "WARNING: ", ($counts{'WARNING'} || 0), " occurrences\n\n";
if($latest{'INFO'}){
	print "Most Recent INFO:\n";
	print "Timestamp: $latest{'INFO'}{timestamp}\n";
	print "Message: $latest{'INFO'}{message}\n\n";
}
if($latest{'WARNING'}){
	print "Most Recent WARNING:\n";
	print "Timestamp: $latest{'WARNING'}{timestamp}\n";
	print "Message: $latest{'WARNING'}{message}\n\n";
}
if($latest{'ERROR'}){
	print "Most Recent ERROR:\n";
	print "Timestamp: $latest{'ERROR'}{timestamp}\n";
	print "Message: $latest{'ERROR'}{message}\n";
}
