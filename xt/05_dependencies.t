# -*- mode: cperl; -*-
use Test::Dependencies
    exclude => [qw(Test::Dependencies Test::Base Test::Perl::Critic
                   Net::IP::Match::Trie)],
    style   => 'light';
ok_dependencies();
