package HashData;

use strict;

# AUTHORITY
# DATE
# DIST
# VERSION

1;
# ABSTRACT: Specification for HashData::*, modules that contains hash data

=head1 SYNOPSIS

Use one of the C<Hash::*> modules.


=head1 SPECIFICATION VERSION

0.1


=head1 DESCRIPTION

B<NOTE: EARLY SPECIFICATION; THINGS WILL STILL CHANGE A LOT>.

C<HashData::*> modules are modules that contain hash data. The hash can be
stored in an actual Perl hash in the source code, or as lines in the DATA
section of the source code, or in other places. The hash data can be accessed
via a standard interface (see L<HashDataRole::Spec::Basic>). Some examples of
hash data are:

=over

=item * A mapping between PAUSE IDs and CPAN author names (L<HashData::CPAN::AuthorName::ByPAUSEID>)

=item * A mapping of ISO 2-letter country codes with their English names (L<HashData::Country::EN::EnglishName::ByISO2>)

=item * A mapping of answer word and their clues from New York Times 2000 cross-word puzzles, handy for generating cross-word puzzle games (L<HashData::Word::EN::NYT::2000::Clue::ByWord>)

=item * FOLDOC dictionary, entries with their definition (L<HashData::Dict::EN::FOLDOC>)

Also eligible for cross-word or word-guessing games.

=item * Another dictionary (L<HashData::Dict::ID::KBBI>)

Also eligible for cross-word or word-guessing games.

=back

Why put data in a Perl module, as a Perl distribution? To leverage the Perl/CPAN
toolchain and infrastructure: 1) ease of installation, update, and
uninstallation; 2) allowing dependency expression and version comparison; 3)
ease of packaging further as OS packages, e.g. Debian packages (converted from
Perl distribution); 4) testing by CPAN Testers.

To get started, see L<HashDataRole::Spec::Basic> and one of existing
C<HashData::*> modules.


=head1 NAMESPACE ORGANIZATION

C<HashData> (this module) is the specification.

C<HashDataRole::*> the roles.

C<HashDataRoles-*> is name for distribution that contains several roles.

C<HashDataBase::*> the base classes. C<HashDataBases::*> are main module names
for distributions that bundle multiple base classes.

All the modules under C<HashData::*> will be modules with actual data. They
should be named using this rule:

 HashData::<CATEGORY>::<VALUE_ENTITY>::By<KEY_ENTITY>

I<CATEGORY> can be multiple levels. I<VALUE_ENTITY> and I<KEY_ENTITY> should be
in singular form. Examples:

 HashData::CPAN::AuthorName::ByPAUSEID
 HashData::Country::EN::EnglishName::ByISO2
 HashData::Country::EN::EnglishName::ByISO3
 HashData::Country::EN::IndonesianName::ByISO2
 HashData::Country::EN::IndonesianName::ByISO3
 HashData::Country::EN::ISO2::ByIndonesianName (reverse mapping of country Indonesian names to ISO 2-letter codes)

An exception is L<HashData::Dict::*> where it is assumed that keys will be
entries (usually words) and values will be the entries' definitions. Examples:

 HashData::Dict::EN::OxfordLearner (no need for: HashData::Dict::EN::OxfordLearner::Definition::ByWord)
 HashData::Dict::ID::KBBI
 HashData::Dict::EN::FOLDOC

C<HashDataBundle-*> is name for distribution that contains several C<HashData>
modules.


=head1 FAQ


=head1 SEE ALSO

Related projects: L<ArrayData>, L<TableData>.
