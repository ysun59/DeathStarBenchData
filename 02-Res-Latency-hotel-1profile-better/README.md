# Hotel Reservation Data - 1 profile - better

let 13 firecrackers, each set to different cores, from core 0,2,4,6,8…….20

set frontend to core 1, 3, 5, 7

set wrk to core 31

## Overall CPU Excel
Can see the overall CPU utilization, throughtput, BW etc. in this excel [Latency of HotelReservation - 1profile - better](https://docs.google.com/spreadsheets/d/1_t2eJdry_HFz5YUytr2Qc2vPFCRCXc6_pGuTCbmx8jA/edit#gid=0).

## Overall Cpu Utilization
Overall cpu utilization comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, different -R, according to the data in the upper excel [Latency of HotelReservation - 1profile - better](https://docs.google.com/spreadsheets/d/1_t2eJdry_HFz5YUytr2Qc2vPFCRCXc6_pGuTCbmx8jA/edit#gid=0)

![CPU_Utilization_1Profile_Better](CPU_Utilization_hotel_1profile_better.png)

## Avg Latency
Avg Latency comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, dirrerent -R, according to the data in the upper excel [Latency of HotelReservation - 1profile - better](https://docs.google.com/spreadsheets/d/1_t2eJdry_HFz5YUytr2Qc2vPFCRCXc6_pGuTCbmx8jA/edit#gid=0)

![Avg_Latency_1Profile_Better](Avg_Latency_hotel_1profile_better.jpg)

## Mpstat-UsrSysEtc
The mpstat result,under the condition: t_10_c_30_frontCore_4_wrk_1, -R 1500, compare the UsrSysEtc result of "container set" and "firecracker set"

![Mpstat_UsrSysEtc_R1500_1Profile_Better](mpstat_UsrSysEtc-containerSet-firecrackerSet-R-1500-1profile-better.jpg)

## Difference between 1 profile and 1 profile - better
- 原本叠加在core 20上的 hotel-reserv-recommendation-mongo (20)，hotel-reserv-reservation-mongo(13,15)，hotel-reserv-user-mongo(22)分开放在不同的core上了；
- profile依旧被动设置一个core;
- hotel-reserv-reservation-mongo给了2个core,从叠在core 20上变成分布在core 13,15上。

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
* hotel-reserv-user-mongo  ----------------------- core 22

* hotel-reserv-profile ---—----------------------- core 24(这个本来设置2个core的，但是在两个机子上跑firecracker时候会挂掉，所以给一个core)
* hotel-reserv-search --—------------------------- core 28, 30

* hotel-reserv-reservation-mongo \ --------------- core 13, 15(这个本来只需要一个core，而且本身cpu利用率非常少，是和别的叠在一起的，但是两个机子container swarm random的时候会挂掉，所以给2个core)
* Hotel-reserv-rate —----------------------------- core 17, 19
* hotel-reserv-reservation —---------------------- core 21, 23
* hotel-reserv-reservation-mmc —---—---------------core 25, 27


## Generation Scrpts：
* test-CPU-randomCore-grayfox-latency-firecracker
* test-CPU-oddEvenCore-grayfox-latency-firecracker
* Command out the line contains `runPerf.sh`


## Data to use:
grayfox /root/yu/Res-Latency-hotel-1profile-better