#!/usr/bin/env bats

CFG="snort.lua"
OPTION="-q -A csv -k none -U -H"

@test "Basic stream_file functional test" {
    $snorty_path/bin/snort -c $CFG --daq-dir $SNORT_DAQS --daq file -r malware.pdf -s 8192 $OPTION > snort.out
    diff -Bb expected snort.out
}

teardown()
{
    rm -f snort.out
}

