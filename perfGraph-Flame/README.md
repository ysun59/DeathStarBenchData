# Perf Flame Graph
This is the FlameGraph of running  "hotel_reservation" under the condition: thread_10_connection_30_Request/second_4000, 
- frontend: random 4 cores.
- wrk: core 31
- container random
- from 25s - 35 s

## Script
Use the command below to collect data
'''bash
sleep 25
perf record -F 99 -C 1 -g -o "/root/yu/Res/$1/perf.data" -- sleep 10
'''
-C 1 means collect the data in core 1, sleep 10 means collect 10s's data.

This will generate perf.data file.

## Deal with Data
Download the [Flamegraph folder](https://github.com/brendangregg/FlameGraph) from github.
'''bash
git clone https://github.com/brendangregg/FlameGraph.git
'''
We need to use the executable file stackcollapse-perf.pl and flamegraph.pl in it.

Use the scripts below to generate Flame Graph
'''bash
perf script -i perf.data > perf.unfold
./stackcollapse-perf.pl perf.unfold > perf.folded
./flamegraph.pl perf.folded > res_R_4000_container_random.svg
'''
