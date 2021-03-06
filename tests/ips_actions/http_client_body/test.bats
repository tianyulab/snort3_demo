#!/usr/bin/env bats

PCAP="hex-all-vars_post-POST-chunk_2.pcap"
CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "HTTP Client Body - parameter extraction and normalization with %u encoding" {
    $snorty_path/bin/snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}

