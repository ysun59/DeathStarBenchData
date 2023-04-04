# Hotel Reservation Data

let 13 firecrackers, each set to different cores, from core 0,2,4,6,8…….20

set frontend to core 1, 3, 5, 7

set wrk to core 31

## Overall CPU Excel
Can see the overall CPU utilization, throughtput, BW etc. in this excel [Latency of HotelReservation - 1profile](https://docs.google.com/spreadsheets/d/1V2xNBc6SFpd61tMx0VRsOVSp7tgv5Kaim13BFBtLXWw/edit#gid=0).

## Overall Cpu Utilization
Overall cpu utilization comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, different -R, according to the data in the upper excel [Latency of HotelReservation - 1profile](https://docs.google.com/spreadsheets/d/1V2xNBc6SFpd61tMx0VRsOVSp7tgv5Kaim13BFBtLXWw/edit#gid=0)

![CPU_Utilization_1Profile](CPU_Utilization_hotel_1profile.png)

## Avg Latency
Avg Latency comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, dirrerent -R, according to the data in the upper excel [Latency of HotelReservation - 1profile](https://docs.google.com/spreadsheets/d/1V2xNBc6SFpd61tMx0VRsOVSp7tgv5Kaim13BFBtLXWw/edit#gid=0)

![Avg_Latency_1Profile](Avg_Latency_hotel_1profile.jpg)

## Mpstat-UsrSysEtc
The mpstat result,under the condition: t_10_c_30_frontCore_4_wrk_1, -R 1500, compare the UsrSysEtc result of "container set" and "firecracker set"

![Mpstat_UsrSysEtc_R1500_1Profile](mpstat_UsrSysEtc-containerSet-firecrackerSet-R-1500-1profile.jpg)

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

* hotel-reserv-profile ---—----------------------- core 22
* hotel-reserv-search --—------------------------- core 26, 28
* Hotel-reserv-rate —----------------------------- core 17, 19
* hotel-reserv-reservation —---------------------- core 21, 23
* hotel-reserv-reservation-mmc —---—---------------core 25, 27


## Generation Scrpts：
* test-CPU-randomCore-grayfox-latency-firecracker
* test-CPU-oddEvenCore-grayfox-latency-firecracker
* Command out the line contains `runPerf.sh`

## Data to use:
grayfox /root/yu/Res-Latency-hotel-1profile