#!/usr/bin/perl
use strict;

use Test::More skip_all => 'GAL::Parser::complete_genomics_new in developement';

BEGIN {
	use lib '../../';
	use_ok('GAL::Parser::complete_genomics_new');
}

my $path = $0;
$path =~ s/[^\/]+$//;
$path ||= '.';
chdir($path);

my $object = GAL::Parser::complete_genomics_new->new();
isa_ok($object, 'GAL::Parser::complete_genomics_new');

# To get a list of all of the subs and throws:
# Select an empty line and then: C-u M-| grep -nP '^sub ' ../Class.pm
# Select an empty line and then: C-u M-| grep -C2 -P '\>throw(' ../Class.pm

while (my $variant = $parser->next_feature_hash) {
  ok($variant, 'variant parses');
}

done_testing();

################################################################################
################################# Ways to Test #################################
################################################################################

__END__



=head3
# Various other ways to say "ok"
ok($this eq $that, $test_name);

is  ($this, $that,    $test_name);
isnt($this, $that,    $test_name);

# Rather than print STDERR "# here's what went wrong\n"
diag("here's what went wrong");

like  ($this, qr/that/, $test_name);
unlike($this, qr/that/, $test_name);

cmp_ok($this, '==', $that, $test_name);

is_deeply($complex_structure1, $complex_structure2, $test_name);

can_ok($module, @methods);
isa_ok($object, $class);

pass($test_name);
fail($test_name);

BAIL_OUT($why);
=cut
