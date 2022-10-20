# Perf Flame Graph
This is the FlameGraph of running  "hotel_reservation" under the condition: thread_10_connection_30_Request/second_3000, 
- frontend: 4 cores.
- wrk: core 31
- container random, container set, firecracker random, firecracker set
- from 25s - 35 s
- R 3000
- collect date from all cores

## Script
According the [Timed Profiling](https://brendangregg.com/perf.html#TimedProfiling) tutorial. Use the command below to collect data.
```bash
sleep 25
perf record -F 99 -a -g -o "/root/yu/Res/$1/perf.data" -- sleep 10
```
This will generate perf.data file.

## Deal with Data
### Generate txt file
```bash
perf --no-pager report --stdio >> res.txt
```
Also, you can use command below to see in the terminal directly. Use `j` or `k` to see more.
```bash
perf report --stdio
```

### Generate Flame Graph
Download the [Flamegraph folder](https://github.com/brendangregg/FlameGraph) from github. We need the executable files stackcollapse-perf.pl and flamegraph.pl in it.
```bash
git clone https://github.com/brendangregg/FlameGraph.git
```

Use the scripts below to generate Flame Graph
```bash
perf script -i perf.data > perf.unfold
./stackcollapse-perf.pl perf.unfold > perf.folded
./flamegraph.pl perf.folded > res_R_4000_container_random.svg
```

## VMs - Corresponding cores
* consul \ -—-—----------------—------------------ core 0
* hotel-reserv-geo \ —---------------------------- core 2
* hotel-reserv-recommendation \ -——-—------------- core 4
* hotel-reserv-user \ —-------------—------------- core 6
* hotel-reserv-jaeger \ ----------—--------------- core 8
* hotel-reserv-rate-mmc \ ---------—-------------- core 10
* hotel-reserv-profile-mmc \ ----------—---------- core 12
* hotel-reserv-geo-mongo \ ----------—------------ core 14
* hotel-reserv-profile-mongo \ ------------------- core 16
* hotel-reserv-rate-mongo \ -----------—---------- core 18
* hotel-reserv-recommendation-mongo -------------- core 20

* hotel-reserv-reservation-mongo \ --------------- core 20
* hotel-reserv-user-mongo  ----------------------- core 20

* hotel-reserv-profile ---—----------------------- core 22, 24
* hotel-reserv-search --—------------------------- core 26, 28
* Hotel-reserv-rate —----------------------------- core 17, 19
* hotel-reserv-reservation —---------------------- core 21, 23
* hotel-reserv-reservation-mmc —---—---------------core 25, 27

let 13 firecrackers, each set to different cores, from core 0,2,4,6,8…….20

set frontend to core 1,3,5,7)

set wrk to core 31
