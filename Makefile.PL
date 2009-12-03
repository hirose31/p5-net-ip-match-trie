use inc::Module::Install;

name     'Net-IP-Match-Trie';
all_from 'lib/Net/IP/Match/Trie.pm';
license  'perl';

# requires '';

tests 't/*.t';
author_tests 'xt';

build_requires 'Test::More';
auto_set_repository;
use_test_base;
auto_include;
WriteAll;
