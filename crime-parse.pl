#!/usr/bin/perl

use Data::Dumper;
use Text::CSV;

print "Usage: $0 <tablename> <infile> <outfile>\n";
open(FILE, $ARGV[1]) || die "Can't open input file - $!\n";
my $csv = Text::CSV->new();
open(OUTFILE, '>'.$ARGV[2]) || die "Can't open OUTPUT file - $!\n";

my $record_count;

print "Parsing Rows";
while(<FILE>) {
  if($csv->parse($_)) {
    my @columns = $csv->fields();
    if($record_count % 100 == 0) { print "."; }
    $date = date2mysqldate($columns[1]);

    # Remove quotes & build Query
    my $sql = qq/INSERT INTO $ARGV[0] VALUES('0' /;
    foreach $key (keys @columns) {
      $columns[$key] =~ s/\"//g;
      if($key == 1) { # sub in date
        $columns[$key] = $date;
      }

      # Escape sequence 3.2.1...
      $columns[$key] =~ s/'/\'/g;
      $columns[$key] =~ s/"/\"/g;
      $columns[$key] =~ s/\\/\\\\/g;

      $sql .= qq/, '$columns[$key]'/;
    }
    $sql .= ");\n";
    print OUTFILE $sql."\n";
    $record_count++;
  }
}
print "\nProcessed $record_count records\n";

sub date2mysqldate {
  $raw_date = shift;
  print Dumper @_;
  $raw_date =~ s/\"//g;
  my($date, $time) = split(/ /, $raw_date);

  # Date Setup
  my($month, $day, $year) = split(/\//, $date);
  $out  = $year."-".sprintf('%02d', $month)."-".sprintf('%02d', $day);

  return $out." ".$time;
}
