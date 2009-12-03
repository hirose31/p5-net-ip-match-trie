# -*- mode: cperl; -*-
use Test::Base;
plan tests => 1 * blocks;

use Net::IP::Match::Trie;

my $matcher = Net::IP::Match::Trie->new;
$matcher->add(foo    => [qw(10.0.0.0/24 10.0.1.0/24 11.0.0.0/16)]);
$matcher->add(bar    => [qw(10.1.0.0/28)]); # 0..15
$matcher->add(bigfoo => [qw(10.0.0.0/8)]);
$matcher->add(foo2   => [qw(10.2.0.0/24)]);

sub do_match {
    $matcher->match_ip(shift) || "NOT_MATCH";
}

filters { input => 'do_match', };

run_is input => 'expected';

__END__

=== foo
--- input: 10.0.0.100
--- expected: foo

=== bar
--- input: 10.1.0.8
--- expected: bar

=== not match
--- input: 192.168.1.2
--- expected: NOT_MATCH

=== foo min
--- input: 10.0.0.0
--- expected: foo

=== foo max
--- input: 10.0.0.255
--- expected: foo

=== invalid IP
--- input: 11.0.999.1
--- expected: NOT_MATCH

=== 0.0.0.0
--- input: 0.0.0.0
--- expected: NOT_MATCH

=== 255.255.255.255
--- input: 255.255.255.255
--- expected: NOT_MATCH

=== bigfoo
--- input: 10.255.255.255
--- expected: bigfoo

=== foo2
--- input: 10.2.0.1
--- expected: foo2
