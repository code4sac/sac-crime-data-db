#!/usr/bin/perl

use Data::Dumper;
use Text::CSV;
exit;

print "Usage: $0 <tablename> <infile> <outfile>\n";
open(FILE, $ARGV[1]) || die "Can't open input file - $!\n";
open(OUTFILE, '>'.$ARGV[2]) || die "Can't open OUTPUT file - $!\n";

my $record_count;

while(<FILE>) {
  $_ =~ s/\n|\r//g;
  @record   = split(/,/);
  $date = date2mysqldate($record[1]);

  # Remove quotes & build Query
  my $sql = "INSERT INTO ".$ARGV[0]." VALUES('0' ";
  foreach $key (keys @record) {
    $record[$key] =~ s/\"//g;
    if($key == 1) {
      $record[$key] = $date;
    }
    $sql .= ", '".$record[$key]."'\n";
  }
  $sql .= ");\n";

  print OUTFILE $sql;
  $record_count++;
}
print "Processed $record_count records\n";

sub date2mysqldate {
  $raw_date = shift;
  $raw_date =~ s/\"//g;
  my($date, $time) = split(/ /, $raw_date);

  # Date Setup
  my($month, $day, $year) = split(/\//, $date);
  $out  = $year."-".sprintf('%02d', $month)."-".sprintf('%02d', $day);

  return $out." ".$time;
}
