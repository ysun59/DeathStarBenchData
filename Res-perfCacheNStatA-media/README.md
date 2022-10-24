# Media Microservices Perf Data
# Set core
Total 33 containers, 32 firecrackers

let 30 firecrackers, each set to different one core, from core 0,2,4,6,8…….30 AND 17, 19, 21

let firecracker media-microservice-compose-review-memcached set to core 23, 25

set social-network-compose-post-service to core 1, 3, 5, 7

set wrk to core 31

If it is container, the container mediamicroservices-dns-media-1 set to core 27

This time not set to specific cores, just limit the number of cores!!

## Overall Perf Excel
Can see the overall Perf data in this excel [Perf of MediaMicroservices](https://docs.google.com/spreadsheets/d/1zaOMOGnkU5PWuiPJSd_X1S7XV-J2tkXLZaWdLIcMfCQ/edit#gid=0).

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
* media-microservice-jaeger \ -—-—----------------—------------------ core 0
* media-microservice-rating-redis \ -—-—----------------—------------ core 2
* media-microservice-movie-review-redis \ -—-—----------------—------ core 4
* media-microservice-user-review-redis \ -—-—------------------------ core 6
* media-microservice-movie-id-memcached \ -—-—----------------—------ core 8
* media-microservice-user-memcached \ -—-—-----------------—--------- core 10
* media-microservice-review-storage-mongodb \ -—-—----------------—-- core 12
* media-microservice-user-review-mongodb \ -—-—----------------—----- core 14
* media-microservice-movie-review-mongodb \ -—-—----------------—---- core 16
* media-microservice-nginx-web-server \ -—-—------—------------------ core 18
* media-microservice-movie-id-service \ -—-—------------------------- core 20
* media-microservice-unique-id-service \ -—-—------------------------ core 22
* media-microservice-text-service \ -—-—----------------—------------ core 24
* media-microservice-rating-service \ -—-—----------------—---------- core 26
* media-microservice-user-service \ -—-—----------------—------------ core 28
* media-microservice-review-storage-service \ -—-—------------------- core 30

* media-microservice-user-review-service \ -—-—---------------------- core 17
* media-microservice-movie-review-service \ -—-—--------------------- core 19

* media-microservice-review-storage-memcached  -—-—------------------ core 21
* media-microservice-cast-info-memcached  -—-—----------------—------ core 21
* media-microservice-plot-memcached  -—-—---------—------------------ core 21
* media-microservice-movie-info-memcached  -—-—----------------—----- core 21
* media-microservice-movie-id-mongodb  -—-—-------------------------- core 21
* media-microservice-user-mongodb  -—-—-----------—------------------ core 21
* media-microservice-cast-info-mongodb  -—-—------------------------- core 21
* media-microservice-plot-mongodb  -—-—----------------—------------- core 21
* media-microservice-movie-info-mongodb  -—-—------------------------ core 21
* media-microservice-cast-info-service  -—-—------------------------- core 21
* media-microservice-plot-service  -—-—----------------—------------- core 21
* media-microservice-movie-info-service  -—-—------------------------ core 21

* media-microservice-compose-review-memcached \ -—-—---------—------- core 23, 25

* media-microservice-compose-review-service \ -—-—------------------- core 1, 3, 5, -more- 15

* container mediamicroservices-dns-media-1 -—-—---------------------- core 27

## There is little different from set cores
- In oddEvenCore set condition:
    - media-microservice-review-storage-memcached
    - media-microservice-cast-info-memcached
    - media-microservice-plot-memcached
    - media-microservice-movie-info-memcached
    - media-microservice-movie-id-mongodb
    - media-microservice-user-mongodb
    - media-microservice-cast-info-mongodb
    - media-microservice-plot-mongodb
    - media-microservice-movie-info-mongodb
    - media-microservice-cast-info-service
    - media-microservice-plot-service
    - media-microservice-movie-info-service
    
    All set to only one core - core 21
- In randomCore condition:
    - upper vms are each set to at most --cpus 1

- Container has 33 vms(container mediamicroservices-dns-media-1), firecracker has 32 vms

## Generation Scrpts：
* test-CPU-randomCore-grayfox-latency-firecracker
* test-CPU-oddEvenCore-grayfox-latency-firecracker
* No need to command out the line contains `runPerf.sh`

# Data to use:
grayfox /root/yu/Res-perfCacheNStatA-media