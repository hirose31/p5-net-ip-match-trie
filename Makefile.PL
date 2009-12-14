use inc::Module::Install;

name     'Net-IP-Match-Trie';
all_from 'lib/Net/IP/Match/Trie.pm';
license  'perl';

cc_optimize_flags "-O2";
#cc_optimize_flags "-O0 -g";

# requires '';

tests 't/*.t';
# author_tests 'xt';

test_requires 'Test::More';
test_requires 'Test::Requires';
test_requires 'FindBin';
test_requires 'Path::Class';
auto_set_repository;
use_test_base;
auto_include;
WriteAll;
