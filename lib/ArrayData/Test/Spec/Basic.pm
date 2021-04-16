package ArrayData::Test::Spec::Basic;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

use Role::Tiny::With;

with 'ArrayDataRole::Spec::Basic';

my $elems = [
    1,
    2,
    undef,
    4,
];

sub new {
    my $class = shift;
    bless {index=>0}, $class;
}

sub _elems {
    my $self = shift;
    $elems;
}

sub elem {
    my $self = shift;
    die "Out of range" unless $self->{index} < @$elems;
    $elems->[ $self->{index}++ ];
}

sub get_elem {
    my $self = shift;
    return undef unless $self->{index} < @$elems;
    $elems->[ $self->{index}++ ];
}

sub get_iterator_index {
    my $self = shift;
    $self->{index};
}

sub reset_iterator {
    my $self = shift;
    $self->{index} = 0;
}

1;

# ABSTRACT: A test table data

=for Pod::Coverage ^(.+)$
