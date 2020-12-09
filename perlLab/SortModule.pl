#!/usr/bin/perl
#------------------------------------------------
#
# Author: Anna Williams
# Last Update: 9/25/2019
# 
# Class Name: Sorter
#
#------------------------------------------------

{
	package Sorter;
	use strict;

	#BubbleSort(\@Key, \@value) 
	sub BubbleSort
	{
		my ($key, $value) = @_;
		my $n = scalar(@{$key});
		my $looper1;
		my $looper2;

		for($looper1 = 0; $looper1 < $n - 1; $looper1 += 1)
		{
			for($looper2 = 0; $looper2 < $n - $looper1 - 1; $looper2)
			{
				if(@{$value}[$looper2] > @{$value}[$looper2 + 1])
				{
					Swap(\@{$value}[$looper2], @{$value}[$looper2 + 1]);
					Swap(\@{$key}[$looper2], @{$key}[$looper2 + 1]);
				}
			}
		}
	}

	#Swap(\$val1, \$val2)
	sub Swap
	{
		my ($val1, $val2) = @_;
		my $val3;

		$val3 = @{$val2};
		@{$val2} = @{$val1};
		@{$val1} = $val3;
	}
}