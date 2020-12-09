#!/usr/bin/perl -l
use Spreadsheet::Read;
use Scalar::Util qw(looks_like_number);
use strict;
use warnings;

#GetData(\@catName, \@catCount, \@catInstall)
sub GetData
{
	my ($catName, $catCount, $catInstall) = @_;
	my $appData = Spreadsheet::Read->new("googleplaystore.xlsx")->sheet(1);
	my $rows = $appData->maxrow;
	my $index;
	my $catIndex;
	my $catFound;
	my $installs;
	my $category;

	#while there is data to read
	for($index = 2; $index < $rows; $index = $index + 1)
	{
		$installs = $appData->cell(6, $index);
		$category = $appData->cell(2, $index);

		#proccess and check installs
		$installs =~ s/[+,]//g;

		if(looks_like_number($installs))
		{
			$catFound = 0;

			for($catIndex = 0; $catIndex < scalar(@{$catName}); $catIndex = $catIndex + 1)
			{
				if(@{$catName}[$catIndex] eq $category && $catFound == 0)
				{
					@{$catInstall}[$catIndex] = @{$catInstall}[$catIndex] + $installs;
					@{$catCount}[$catIndex] = @{$catCount}[$catIndex] + 1;
					$catFound = 1;
				}
			}

			if($catFound == 0)
			{
				push(@{$catName},$category);
				push(@{$catInstall},$installs);
				push(@{$catCount},1);
			}
		}
	}

	for($catIndex = 0; $catIndex < scalar(@{$catInstall}); $catIndex += 1)
	{
		@{$catInstall}[$catIndex] = @{$catInstall}[$catIndex] / @{$catCount}[$catIndex];
	}

	BubbleSort(\@{$catName}, \@{$catInstall});

}

#BubbleSort(\@Key, \@value) 
sub BubbleSort
{
	my ($key, $value) = @_;
	my $n = scalar(@{$key});
	my $looper1;
	my $looper2;

	for($looper1 = 0; $looper1 < $n - 1; $looper1 += 1)
	{
		for($looper2 = 0; $looper2 < $n - $looper1 - 1; $looper2+= 1)
		{
			
			if(@{$value}[$looper2] < @{$value}[$looper2 + 1])
			{
				Swap(\@{$value}[$looper2], \@{$value}[$looper2 + 1]);
				Swap(\@{$key}[$looper2], \@{$key}[$looper2 + 1]);
			}
		}
	}
}

#Swap(\$val1, \$val2)
sub Swap
{
	my ($val1, $val2) = @_;
	my $val3;

	$val3 = ${$val2};
	${$val2} = ${$val1};
	${$val1} = $val3;
}

my @catName; #This is each Genre Name
my @catCount; #This is the count for apps in that Genre
my @catInstall; #This is the count of apps installed per genra and later the average installs per Genre
my $index;
my $n;

GetData(\@catName, \@catCount, \@catInstall);

$n = scalar(@catInstall);

for($index = 0; $index < $n; $index += 1)
{
	printf("%s %.0f\n", @catName[$index], @catInstall[$index]);
}