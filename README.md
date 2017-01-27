<div>
    <a href="https://travis-ci.org/hirose31/p5-net-ip-match-trie"><img src="https://travis-ci.org/hirose31/p5-net-ip-match-trie.png?branch=master" alt="Build Status" /></a>
    <a href="https://coveralls.io/r/hirose31/p5-net-ip-match-trie?branch=master"><img src="https://coveralls.io/repos/hirose31/p5-net-ip-match-trie/badge.png?branch=master" alt="Coverage Status" /></a>
</div>

# NAME

Net::IP::Match::Trie - Efficiently match IP addresses against IP ranges with Trie (prefix tree)

# SYNOPSIS

    use Net::IP::Match::Trie;
    my $matcher = Net::IP::Match::Trie->new;
    $matcher->add(google => [qw(66.249.64.0/19 74.125.0.0/16)]);
    $matcher->add(yahoo  => [qw(69.147.64.0/18 209.191.64.0/18 209.131.32.0/19)]);
    $matcher->add(ask    => [qw(66.235.112.0/20)]);
    $matcher->add(docomo   => [qw(124.146.174.0/24 ...)]);
    $matcher->add(au       => [qw(59.135.38.128/25 ...)]);
    $matcher->add(softbank => [qw(123.108.236.0/24 ...)]);
    $matcher->add(willcom  => [qw(61.198.128.0/24  ...)]);
    say $matcher->match_ip("66.249.64.1"); # => "google"
    say $matcher->match_ip("69.147.64.1"); # => "yahoo"
    say $matcher->match_ip("192.0.2.1");   # => ""

# DESCRIPTION

Net::IP::Match::Trie is XS or Pure Perl implementation of matching IP address against Net ranges.

Net::IP::Match::Trie uses Trie (prefix tree) data structure, so very fast lookup time (match\_ip) but slow setup (add) time.
This module is useful for once initialization and a bunch of lookups model such as long life server process.

# METHODS

- **add**(LABEL => CIDRS)

        LABEL: Str
        CIDRS: ArrayRef

    register CIDRs to internal data tree labeled as "LABEL".

- **match\_ip**(IP)

        IP: Str

    return "LABEL" if IP matched registered CIDRs. otherwise return "".

# AUTHOR

HIROSE Masaaki <hirose31@gmail.com>

# REPOSITORY

[https://github.com/hirose31/p5-net-ip-match-trie](https://github.com/hirose31/p5-net-ip-match-trie)

    git clone git://github.com/hirose31/p5-net-ip-match-trie.git

patches and collaborators are welcome.

# SEE ALSO

# COPYRIGHT

Copyright HIROSE Masaaki

# LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.
