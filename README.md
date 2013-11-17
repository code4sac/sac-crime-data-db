# Sacramento Crime Data

This code prepares Sacramento Crime extracts from: (http://www.sacpd.org/crime/stats/) to be inserted into a MySQL database.

The crime extracts are available via CSV file. The unique identifier in these CSV's would be a VARCHAR in MySQL, this code inserts a new INT column that can be configured as a PRIMARY key. The date format is also not optimal for MySQL. This code converts to a "yyyy-mm-dd hh:mm:ss" format for MySQL

The output will be in MySQL INSERT format.

## Requirements
Perl module: Text::CSV
This is required because some of the fields contain quotes & commas.

## Usage
./crime-parse.pl <MySQL tablename> <infile> <outfile>

After you have generated the sql file, you will probably have to insert into database via command line, or other utility that is NOT phpMyAdmin unless you configure phpMyAdmin for huge files. These files are generally > 50M.

mysql -u usernmae -p databasename < outfile


