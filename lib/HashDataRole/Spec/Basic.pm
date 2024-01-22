package HashDataRole::Spec::Basic;

use strict;
use Role::Tiny;
use Role::Tiny::With;

# AUTHORITY
# DATE
# DIST
# VERSION

# constructor
requires 'new';

# mixin
with 'Role::TinyCommons::Iterator::Resettable';
with 'Role::TinyCommons::Collection::GetItemByKey';

# provides

my @role_prefixes = qw(HashDataRole Role::TinyCommons::Collection);
sub apply_roles {
    my ($obj, @unqualified_roles) = @_;

    my @roles_to_apply;
  ROLE:
    for my $ur (@unqualified_roles) {
      PREFIX:
        for my $prefix (@role_prefixes) {
            my ($mod, $modpm);
            $mod = "$prefix\::$ur";
            ($modpm = "$mod.pm") =~ s!::!/!g;
            eval { require $modpm; 1 };
            unless ($@) {
                #print "D:$mod\n";
                push @roles_to_apply, $mod;
                next ROLE;
            }
        }
        die "Can't find role '$ur' to apply (searched these prefixes: ".
            join(", ", @role_prefixes);
    }

    Role::Tiny->apply_roles_to_object($obj, @roles_to_apply);

    # return something useful
    $obj;
}

###

1;
# ABSTRACT: Required methods for all HashData::* classes

=head1 DESCRIPTION

L<HashData>::* classes let you iterate pairs using a resettable iterator
interface (L<Role::TinyCommons::Iterator::Resettable>) as well as get values by
key (L<Role::TinyCommons::Collection::GetItemByPos>), like what a regular Perl
hash lets you.


=head1 ROLES MIXED IN

L<Role::TinyCommons::Iterator::Resettable>

L<Role::TinyCommons::Collection::GetItemByKey>


=head1 REQUIRED METHODS

=head2 new

Usage:

 my $ary = HashData::Foo->new([ %args ]);

Constructor. Must accept a pair of argument names and values.

=head2 get_next_item

From L<Role::TinyCommons::Iterator::Resettable>. Will return an array(ref)
containing two elements: C<< [$key, $value] >>.

=head2 has_next_item

From L<Role::TinyCommons::Iterator::Resettable>.

=head2 reset_iterator

From L<Role::TinyCommons::Iterator::Resettable>.

=head2 get_item_at_key

From L<Role::TinyCommons::Collection::GetItemByKey>.

=head2 has_item_at_key

From L<Role::TinyCommons::Collection::GetItemByKey>.

=head2 has_item_at_key

Alias for L</has_item_at_key>, From
L<Role::TinyCommons::Collection::GetItemByKey>.

=head2 get_all_keys

From L<Role::TinyCommons::Collection::GetItemByKey>.


=head1 PROVIDED METHODS

=head2 apply_roles

Usage:

 $obj->apply_roles('R1', 'R2', ...)

Apply roles to object. R1, R2, ... are unqualified role names that will be
searched under C<HashDataRole::*> or C<Role::TinyCommons::Collection::*>
namespace. It's a convenience shortcut for C<< Role::Tiny->apply_roles_to_object
>>.

Return the object, so you can do something like this:

 my $obj = HashData::Dict::ID::KBBI->new->apply_roles('FindItem::Iterator', 'PickItems::Iterator');

 my $obj = HashData::Word::ID::KBBI->new->apply_roles('BinarySearch::LinesInHandle');


=head1 SEE ALSO

L<Role::TinyCommons::Iterator::Resettable>

L<Role::TinyCommons::Collection::GetItemByPos>
