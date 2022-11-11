# Media Microservices
# Set core
Total 33 containers, 32 firecrackers

let 30 firecrackers, each set to different one core, from core 0,2,4,6,8…….30 AND 17, 19, 21

let firecracker media-microservice-compose-review-memcached set to core 23, 25

set social-network-compose-post-service to core 1 or above (basically core 1,3,5-more-15)

set wrk to core 31, or 31, 29

If it is container, the container mediamicroservices-dns-media-1 set to core 27

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
- Container has 33 vms(container mediamicroservices-dns-media-1), firecracker has 32 vms