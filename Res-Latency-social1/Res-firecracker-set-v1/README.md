# Social Network
## Set core
Total 27 firecrackers.

let 26 firecrackers, each set to different cores, from core 0,2,4,6,8…….30 AND 17, 19, 21, 23 ... 29

set social-network-compose-post-service to core 1 or above (basically core 1,3,5-more-7)

set wrk to core 31

## VMs - Corresponding cores
* social-network-home-timeline-redis \ -——-—--------------------------- core 0
* social-network-user-timeline-redis \ —-----------------—------------- core 2
* social-network-post-storage-mongodb \ ----------------—-------------- core 4
* social-network-social-graph-service \ --------------------—---------- core 6
* social-network-post-storage-service \ ------------------------------- core 8
* social-network-url-shorten-service  \ ------------------------------- core 10

* social-network-user-memcached \ ----------—-----—-----—-------------- core 29 (这个在core29)

* social-network-social-graph-redis \ —-------------------------------- core 12
* social-network-media-service \ -------------------------------------- core 12

* social-network-post-storage-memcached --—---------------------------- core 14
* social-network-url-shorten-memcached ---—---------------------------- core 14
* social-network-media-memcached ---—---------------------------------- core 14
* social-network-social-graph-mongodb ---—----------------------------- core 14
* social-network-user-mongodb ---—------------------------------------- core 14
* social-network-media-mongodb ---—------------------------------------ core 14
* social-network-media-frontend  ---—---------------------------------- core 14
* social-network-user-service \ --------------------------------------- core 14(比较大放14，因为14特别小，avg33, max 41)
* social-network-unique-id-service \ ---------------------------------- core 14(比较大放14，因为14特别小)

* social-network-user-timeline-mongodb \ ------—------------—---------- core 16,18 (27%.52%好像可以合并的,算了，加起来也80～90%了)
* social-network-nginx-thrift \ ------------—-----—-----—-------------- core 20,22
* social-network-user-timeline-service \ ------—-----—----------------- core 24,26
* social-network-user-mention-service \ ------—-----—-----—------------ core 28,30
* social-network-home-timeline-service \ ------—-----—----------------- core 9,11

* social-network-jaeger-agent \ -—-—----------------—------------------ core 13, 15 （avg 33, max 85只能单独放，一段时间跳一下的）
* social-network-url-shorten-mongodb \ -------------------—------------ core 17, 19 （这个其实后面好像还会变成bottleneck的但是没办法，没有更多的core了）

* social-network-text-service \ ------------—-----—-----—-----—-------- core 21,23,25,27（4个用处似乎不大,但是看数值37%，70% 29% 28%感觉还是有用的）


* social-network-compose-post-service \ ---—----------------------- core 1, 3, 5,-more- 7

wrk 31