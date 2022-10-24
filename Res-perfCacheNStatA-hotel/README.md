# Hotel Reservation Perf Data

let 13 firecrackers, each set to different cores, from core 0,2,4,6,8…….20

set frontend to core  1, 3, 5, 7

set wrk to core 31

Test two perf data: Perf Cache and Perf stat -a

## Overall Perf Excel
Can see the overall Perf data in this excel [Perf of HotelReservation](https://docs.google.com/spreadsheets/d/1TrBh9p-e5ZvEHpTV7RjCnJprcAX9USj5mwxQ-W7hJdI/edit#gid=0).

## Perf Cache
According to the [perf-stat](https://man7.org/linux/man-pages/man1/perf-stat.1.html) tutorial. Use the command below to collect data.
```bash
perf stat -e L1-dcache-load-misses,L1-dcache-loads,LLC-load-misses,LLC-loads,LLC-store-misses,LLC-stores,dTLB-load-misses,dTLB-loads,dTLB-store-misses,dTLB-stores,iTLB-load-misses,iTLB-loads -a -o "/root/yu/Res/$1/perf_stat_cache.txt" -- sleep 10
```
Guess: 
- () means how many data collected, 大概意思就是采集不是完全都采集到的。refer [The Lunux perf Event Scheduling Algorithm](https://hadibrais.wordpress.com/2019/09/06/the-linux-perf-event-scheduling-algorithm/)
- store miss: 写回的时候目标不在cache里在内存里，就会store miss
- loads就是读到了, 所以读到的数目就是hits。尝试读 = 读到 + 没读到。得到的16.3%是没读到的占读到的比例

## Perf Stat -a
Use the command below to collect data.
```bash
perf stat -a -o "/root/yu/Res/$1/perf_stat_a.txt" -- sleep 10
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


## Generation Scrpts：
* test-CPU-randomCore-grayfox-latency-firecracker
* test-CPU-oddEvenCore-grayfox-latency-firecracker
* No need to command out the line contains `runPerf.sh`

# Data to use:
grayfox /root/yu/Res-perfCacheNStatA-hotel