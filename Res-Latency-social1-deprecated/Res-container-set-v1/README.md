# Social Network
## Set core
Total 27 firecrackers.

let 26 firecrackers, each set to different cores, from core 0,2,4,6,8…….30 AND 17, 19, 21, 23

set social-network-compose-post-service to core 1 or above (basically core 1,3,5-more-15)

set wrk to core 31, or 31, 29

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