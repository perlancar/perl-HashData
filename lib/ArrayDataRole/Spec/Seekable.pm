package ArrayDataRole::Spec::Seekable;

# AUTHORITY
# DATE
# DIST
# VERSION

use Role::Tiny;

requires 'set_iterator_index';

sub elem_at_index {
    my ($ary, $index) = @_;
    $ary->set_iterator_index($index);
    $ary->elem;
}

sub get_elem_at_index {
    my ($ary, $index) = @_;
    $ary->set_iterator_index($index);
    $ary->get_elem;
}

1;
# ABSTRACT: Required methods for seekable ArrayData::* modules

=head1 REQUIRED METHODS

=head2 set_iterator_index

Usage:

 $ary->set_iterator_index($index);

C<$index> is a zero-based integer, where 0 refers to the first element, 1 the
second, and so on. Negative index must also be supported, where -1 means the
last element, -2 the second last, and so on.

Must die when seeking outside the range of data (e.g. there are only 5 elements
and this method is called with argument 5 or 6 or -6).


=head1 PROVIDED METHODS

=head2 elem_at_index

Usage:

 my $elem = $ary->elem_at_index($index); # might die

Basically shortcut for:

 $ary->set_row_iterator_index($index);
 $ary->elem;

=head2 get_elem_at_index

Usage:

 my $elem = $ary->get_elem_at_index($index); # might die, might return undef

Basically shortcut for:

 $ary->set_iterator_index($index);
 $ary->get_elem;


=head1 SEE ALSO

L<ArrayDataRole::Spec::Basic>
