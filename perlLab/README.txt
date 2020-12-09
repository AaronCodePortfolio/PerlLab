googlePlayStore.xlsx a is a collection of data about apps from the google playstore.  
GooglePlayStoreData.pl is a Perl program that calculates then sorts the different categories of app based on the average number of downloads.  
SortModule and AppData-Sorter are part of a failed attempt to create a module.
report.txt is the output file for GooglePlayStoreData.pl

The instructions below are for windows
To run this program you will need to:
1. install strawberry Perl
2. open CMD and type cpanm Spreadsheet::Read
3. navigate to the directory that has GooglePlayStoreData.pl
4. type perl GooglePlayStoreData.pl
5. The results are printed to report.txt