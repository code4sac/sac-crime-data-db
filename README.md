# Sacramento Crime Data

This code prepares Sacramento Crime extracts from: (http://www.sacpd.org/crime/stats/) to be inserted into a MySQL database.

The output will be in MySQL INSERT format.

## Requirements
Perl module: Text::CSV
This is required because many of the fields contain quotes.

## Usage
./crime-parse.pl <MySQL tablename> <infile> <outfile>

After you have generated the sql file, you will probably have to insert into database via command line, or other utility that is NOT phpMyAdmin unless you configure phpMyAdmin for huge files. These files are generally > 50M.

mysql -u usernmae -p databasename < outfile


