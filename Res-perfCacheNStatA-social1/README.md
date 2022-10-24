# Social Network Perf Data
# Random core
Total 27 firecrackers.

let 26 firecrackers, each set to 1 core

set social-network-compose-post-service to 1, 3, 5, 7

set wrk to core 31

This time not set to specific cores, just limit the number of cores!!

## Overall Perf Excel
Can see the overall Perf data in this excel [Perf of SocialNetwork1](https://docs.google.com/spreadsheets/d/1p-JXlBnkdgEr40PYGVKiHzCcRPLQTEYAuPCoLf1HOEs/edit#gid=0).

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
* social-network-jaeger-agent \ -—-—----------------—------------------ core 0
* social-network-social-graph-redis \ —---------------------------- core 2
* social-network-home-timeline-redis \ -——-—------------- core 4
* social-network-user-timeline-redis \ —-------------—------------- core 6

* social-network-user-memcached \ ----------—--------------- core 8

* social-network-post-storage-mongodb \ ---------—-------------- core 10
* social-network-user-timeline-mongodb \ ----------—---------- core 12
* social-network-url-shorten-mongodb \ ----------—------------ core 14

* social-network-nginx-thrift \ ------------------- core 16

* social-network-social-graph-service \ -----------—---------- core 18
* social-network-post-storage-service -------------- core 20

* social-network-user-timeline-service \ --------------- core 22
* social-network-url-shorten-service  ----------------------- core 24
* social-network-user-service \ --------------- core 26
* social-network-media-service \ --------------- core 28
* social-network-text-service \ --------------- core 30
* social-network-unique-id-service \ --------------- core 17
* social-network-user-mention-service \ --------------- core 19
* social-network-home-timeline-service \ --------------- core 21

* social-network-post-storage-memcached --—------------------------- core 23
* social-network-url-shorten-memcached ---—----------------------- core 23
* social-network-media-memcached ---—----------------------- core 23
* social-network-social-graph-mongodb ---—----------------------- core 23
* social-network-user-mongodb ---—----------------------- core 23
* social-network-media-mongodb ---—----------------------- core 23
* social-network-media-frontend  ---—----------------------- core 23

* social-network-compose-post-service \ ---—----------------------- core 1, 3, 5, -more- 15


## There is little different from set cores
- In oddEvenCore set condition:
    - social-network-post-storage-memcached
    - social-network-url-shorten-memcached
    - social-network-media-memcached
    - social-network-social-graph-mongodb
    - social-network-user-mongodb
    - social-network-media-mongodb
    - social-network-media-frontend
    
    All set to only one core - core 23
- In randomCore condition:
    - upper vms are each set to at most --cpus 1

## Generation Scrpts：
* test-CPU-randomCore-grayfox-latency-firecracker
* test-CPU-oddEvenCore-grayfox-latency-firecracker
* No need to command out the line contains `runPerf.sh`

# Data to use:
grayfox /root/yu/Res-perfCacheNStatA-social