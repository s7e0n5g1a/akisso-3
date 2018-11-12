#!/bin/bash
#NAME, PID, RSS, STAT, FDSIZE, THREADS 
echo "NAME\tPID\tRSS\tSTAT\tFDSIZE\tTHREADS"



grep -w -i Name /proc/1/status | cut -f 2- | tr -d '\n'

grep -w -i Pid /proc/1/status | cut -f 2- | tr -d '\n'

grep -w -i VmRSS /proc/1/status | cut -f 2- | tr -d '\n'

grep -w -i State /proc/1/status | cut -f 2- | tr -d '\n'

grep -w -i FDsize /proc/1/status | cut -f 2- | tr -d '\n'

grep -w -i Threads /proc/1/status | cut -f 2- | tr -d '\n'



