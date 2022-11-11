# Social Network Latency Data1 - Compose Posts
## Set core
Total 27 firecrackers.

let 26 firecrackers, each set to different cores, from core 0,2,4,6,8…….30 AND 17, 19, 21, 23

set social-network-compose-post-service to core 1, 3, 5, 7

set wrk to core 31

## Overall CPU Excel
Can see the overall CPU utilization, throughtput, BW etc. in this excel [Latency of SocialNetwork1-v2](https://docs.google.com/spreadsheets/d/1Cy9RjgibUyPHLc6Gp9dHuQ3_c7ULYHVXowZhBgvi-Sk/edit#gid=1488032261).

## Overall Cpu Utilization
Overall cpu utilization comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, different -R, according to the data in the upper excel [Latency of SocialNetwork1-v2](https://docs.google.com/spreadsheets/d/1Cy9RjgibUyPHLc6Gp9dHuQ3_c7ULYHVXowZhBgvi-Sk/edit#gid=1488032261)

## Avg Latency
Avg Latency comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, firrerent -R, according to the data in the upper excel [Latency of SocialNetwork1-v2](https://docs.google.com/spreadsheets/d/1Cy9RjgibUyPHLc6Gp9dHuQ3_c7ULYHVXowZhBgvi-Sk/edit#gid=1488032261)

## VMs - Corresponding cores
* social-network-jaeger-agent \ -—-—----------------—------------------ core 0 （avg 33, max 85只能单独放，一段时间跳一下的）
* social-network-home-timeline-redis \ -——-—--------------------------- core 2
* social-network-user-timeline-redis \ —-----------------—------------- core 4
* social-network-post-storage-mongodb \ ----------------—-------------- core 6
* social-network-url-shorten-mongodb \ -------------------—------------ core 8
* social-network-social-graph-service \ --------------------—---------- core 10
* social-network-post-storage-service \ ------------------------------- core 12
* social-network-url-shorten-service  \ ------------------------------- core 14

* social-network-social-graph-redis \ —-------------------------------- core 16
* social-network-media-service \ -------------------------------------- core 16

* social-network-post-storage-memcached --—---------------------------- core 18
* social-network-url-shorten-memcached ---—---------------------------- core 18
* social-network-media-memcached ---—---------------------------------- core 18
* social-network-social-graph-mongodb ---—----------------------------- core 18
* social-network-user-mongodb ---—------------------------------------- core 18
* social-network-media-mongodb ---—------------------------------------ core 18
* social-network-media-frontend  ---—---------------------------------- core 18
* social-network-user-service \ --------------------------------------- core 18(比较大放18，因为18特别小，avg33, max 41)
* social-network-unique-id-service \ ---------------------------------- core 18(比较大放18，因为18特别小)

* social-network-user-memcached \ ----------—-----—-----—-------------- core 20,22
* social-network-user-timeline-mongodb \ ------—------------—---------- core 24,26 (27%.52%好像可以合并的,算了，加起来也80～90%了)
* social-network-nginx-thrift \ ------------—-----—-----—-------------- core 28,30
* social-network-user-timeline-service \ ------—-----—----------------- core 9,11
* social-network-user-mention-service \ ------—-----—-----—------------ core 13,15
* social-network-home-timeline-service \ ------—-----—----------------- core 17,19

* social-network-text-service \ ------------—-----—-----—-----—-------- core 21,23,25,27（4个用处似乎不大,但是看数值37%，70% 29% 28%感觉还是有用的）


* social-network-compose-post-service \ ---—----------------------- core 1, 3, 5,-more- 7

wrk 31
29没用到

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
* Command out the line contains `runPerf.sh`

# Data to use:
grayfox /root/yu/Res-Latency-social1-v2
Data of ComposePosts