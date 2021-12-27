#!/usr/bin/perl

use strict;
use warnings;

use Test::Builder::Tester tests => 3;
use Test::XML::Ordered qw(is_xml_ordered);

# TEST
test_out("not ok 1 - extra attribute for got");
test_diag("Extra attribute for got at 1 ; Expected at 1");
test_fail(+1);
is_xml_ordered(
    [ string => '<xml stuff="foo"/>' ],
    [ string => '<xml/>' ],
    {}, 'extra attribute for got'
);
test_test("is_xml_ordered fails on extra attribute in 'have' XML.");

# TEST
test_out("not ok 1 - missing attribute for got");
test_diag("Missing attribute for got at 1 ; Expected at 1");
test_fail(+1);
is_xml_ordered(
    [ string => '<xml/>' ],
    [ string => '<xml stuff="bar"/>' ],
    {}, 'missing attribute for got'
);
test_test("is_xml_ordered fails on missing attribute in 'have' XML.");

# TEST
test_out("not ok 1 - Attribute value mismatch");
test_diag(
"Got Attribute value: <<foo>> at 1 ; Expected Attribute value: <<bar>> at  1"
);
test_fail(+1);
is_xml_ordered(
    [ string => '<xml stuff="foo"/>' ],
    [ string => '<xml stuff="bar"/>' ],
    {}, 'Attribute value mismatch'
);
test_test("is_xml_ordered fails on attribute value mismatch in two XMLs.");
