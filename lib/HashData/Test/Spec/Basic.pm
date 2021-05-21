package HashData::Test::Spec::Basic;

# AUTHORITY
# DATE
# DIST
# VERSION

use strict;
use warnings;

use Role::Tiny::With;

with 'HashDataRole::Spec::Basic';

my $hash = {
    five  => "lima",
    four  => "empat",
    one   => "satu",
    three => "tiga",
    two   => "dua",
};
my $keys = [sort keys %$hash];

sub new {
    my $class = shift;
    bless {pos=>0}, $class;
}

sub _hash {
    my $self = shift;
    $hash;
}

sub get_next_item {
    my $self = shift;
    die "StopIteration" unless $self->{pos} < @$keys;
    my $key = $keys->[ $self->{pos}++ ];
    [$key, $hash->{$key}];
}

sub has_next_item {
    my $self = shift;
    $self->{pos} < @$keys;
}

sub get_iterator_pos {
    my $self = shift;
    $self->{pos};
}

sub reset_iterator {
    my $self = shift;
    $self->{pos} = 0;
}

sub get_item_at_key {
    my ($self, $key) = @_;
    die "No such key '$key'" unless exists $hash->{$key};
    $hash->{$key};
}

sub has_item_at_key {
    my ($self, $key) = @_;
    exists $hash->{$key};
}

sub get_all_keys {
    my $self = shift;
    [@$keys];
}

1;

# ABSTRACT: A test hash data

=for Pod::Coverage ^(.+)$
