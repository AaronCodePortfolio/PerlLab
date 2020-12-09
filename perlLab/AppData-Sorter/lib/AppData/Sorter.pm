package AppData::Sorter;

use 5.006;
use strict;
use warnings;

=head1 NAME

AppData::Sorter - The great new AppData::Sorter!

=head1 VERSION

Version 0.01

=cut



our $VERSION = '0.01';


=head1 SYNOPSIS

Quick summary of what the module does.

Perhaps a little code snippet.

    use AppData::Sorter;

    my $foo = AppData::Sorter->new();
    ...

=head1 EXPORT

A list of functions that can be exported.  You can delete this section
if you don't export anything, such as for a purely object-oriented module.

=head1 SUBROUTINES/METHODS

=head2 function1

=cut

package Sorter;
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

sub function1 {
}

=head2 function2

=cut

sub function2 {
}

=head1 AUTHOR

Anna Williams, C<< <williaab at alfredstate.edu> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-appdata-sorter at rt.cpan.org>, or through
the web interface at L<https://rt.cpan.org/NoAuth/ReportBug.html?Queue=AppData-Sorter>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc AppData::Sorter


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker (report bugs here)

L<https://rt.cpan.org/NoAuth/Bugs.html?Dist=AppData-Sorter>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/AppData-Sorter>

=item * CPAN Ratings

L<https://cpanratings.perl.org/d/AppData-Sorter>

=item * Search CPAN

L<https://metacpan.org/release/AppData-Sorter>

=back


=head1 ACKNOWLEDGEMENTS


=head1 LICENSE AND COPYRIGHT

This software is Copyright (c) 2019 by Anna Williams.

This is free software, licensed under:

  The Artistic License 2.0 (GPL Compatible)


=cut

1; # End of AppData::Sorter
