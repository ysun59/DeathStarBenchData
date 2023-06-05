# Media Microservices Perf Data - Swarm
## Set core
Total 33 containers, 32 firecrackers

let 30 firecrackers, each set to different one core, from core 0,2,4,6,8…….30 AND 17, 19, 21

let firecracker media-microservice-compose-review-memcached set to core 23, 25

set social-network-compose-post-service to core 1 or above (basically core 1,3,5，7)

set wrk to core 31, or 31, 29

Test two perf data: Perf Cache and Perf stat -a

## Overall Perf Excel
Can see the overall Perf data in this excel [Perf of MediaMicroservices Swarm-03](https://docs.google.com/spreadsheets/d/14XNSVlUjwLlqAfsn6rPLnKIlKBZHeM5JhRuy0WkPATk/edit#gid=0).

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

## VMs - Corresponding cores, master machine
* media-microservice-unique-id-service \ -—-—------------------------ core 0
* media-microservice-text-service \ -—-—----------------—------------ core 2
* media-microservice-rating-service \ -—-—----------------—---------- core 4
* media-microservice-user-service \ -—-—----------------—------------ core 6
* media-microservice-review-storage-service \ -—-—------------------- core 8
* media-microservice-user-review-service \ -—-—---------------------- core 10
* media-microservice-movie-review-service \ -—-—--------------------- core 12

* media-microservice-cast-info-service  -—-—------------------------- core 14
* media-microservice-movie-info-service  -—-—------------------------ core 16
* media-microservice-plot-service  -—-—----------------—------------- core 18

* media-microservice-jaeger \ -—-—----------------—------------------ core 20,22（R-800隔一段时间会很多，改成2个了，其实R小的话，不用那么多）
* media-microservice-movie-id-service \ -—-—------------------------- core 24,26
* media-microservice-compose-review-service \ -—-—------------------- core 1, 3, 5, 7(container swarm时候，只有2个PID SPID,设置到了core 1, 7上)

## VMs - Corresponding cores, secondary machine

* media-microservice-review-storage-mongodb \ -—-—----------------—-- core 0
* media-microservice-user-review-mongodb \ -—-—----------------—----- core 2
* media-microservice-movie-review-mongodb \ -—-—----------------—---- core 4
* media-microservice-rating-redis \ -—-—----------------—------------ core 6
* media-microservice-movie-review-redis \ -—-—----------------—------ core 8
* media-microservice-user-review-redis \ -—-—------------------------ core 10
* media-microservice-movie-id-memcached \ -—-—----------------—------ core 12 (后加的)
* media-microservice-user-memcached \ -—-—-----------------—--------- core 14 (后加的)
* media-microservice-review-storage-memcached  -—-—------------------ core 16
* media-microservice-cast-info-memcached  -—-—----------------—------ core 18
* media-microservice-plot-memcached  -—-—---------—------------------ core 20
* media-microservice-movie-info-memcached  -—-—----------------—----- core 22
* media-microservice-movie-id-mongodb  -—-—-------------------------- core 24
* media-microservice-user-mongodb  -—-—-----------—------------------ core 26
* media-microservice-cast-info-mongodb  -—-—------------------------- core 28

* media-microservice-plot-mongodb  -—-—----------------—------------- core 17
* media-microservice-movie-info-mongodb  -—-—------------------------ core 19
* media-microservice-nginx-web-server \ -—-—------—------------------ core 21(没法给多，会崩溃,/core给24， 26能跑28秒左右)
* media-microservice-compose-review-memcached \ -—-—---------—------- core 9,11,13,15


## There is little different from set cores
- Container has 33 vms(container mediamicroservices-dns-media-1), firecracker has 32 vms

## Generation Scrpts：
* test-CPU-randomCore-grayfox-latency-firecracker-swarm
* test-CPU-oddEvenCore-grayfox-latency-firecracker-swarm

## Data
* Res-container-set-Swarm-v1
* Res-container-random-Swarm-v1
* Res-firecracker-set-Swarm-v1
* Res-firecracker-random-Swarm-v1

## Difference of Swarm and non-Swarm
* Swarm mode set vms to 2 machines / ori container test only on one machine
* Swarm don't have vms set to one same core 
* Swam record the BW of the physical network card 