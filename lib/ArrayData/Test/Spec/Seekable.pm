package ArrayData::Test::Spec::Seekable;

# AUTHORITY
# DATE
# DIST
# VERSION

use parent 'ArrayData::Test::Spec::Basic';
use Role::Tiny::With;

with 'ArrayDataRole::Spec::Seekable';

sub set_iterator_index {
    my ($ary, $index) = @_;

    $index = int($index);
    if ($index >= 0) {
        die "Index out of range" unless $index < @{ $ary->_elems };
        $ary->{index} = $index;
    } else {
        die "Index out of range" unless -$index <= @{ $ary->_elems };
        $ary->{index} = @{ $ary->_elems } + $index;
    }
}

1;
