# Hotel Reservation Data - Swarm

let 18 firecrackers, each set to different cores, from core 0,2,4,6,8…….20

set frontend to core 1 or above (basically core 1,3,5-more-15)

set wrk to core 31

This time not set to specific cores, just limit the number of cores!!


## Difference between 1 profile and 1 profile - better (01 vs 02)
- 测一个机子情况的时候，原本叠加在core 20上的 hotel-reserv-recommendation-mongo (20)，hotel-reserv-reservation-mongo(13,15)，hotel-reserv-user-mongo(22)分开放在不同的core上了；
- profile依旧被动设置一个core;
- hotel-reserv-reservation-mongo给了2个core,从叠在core 20上变成分布在core 13,15上。

## Difference between 1 profile - better and 2 profile - better(02 vs 03)
- 因为firecracker的网络修好了，所以profile从1个core变成给了2个core;
- hotel-reserv-reservation-mongo从给了2个core变成给了4个core。

## Difference between 2 profile - better and 2 profile - better - customizaConSet (03 vs 03 customizaConSet)
- only collect data of Swarm Container Set. 把Machine2上的hotel-reserv-reservation-mongo有特别处理了一下，尽量让他均衡了一点

## Overall CPU Excel
Can see the overall CPU utilization, throughtput, BW etc. in this excel [Latency of HotelReservation Swarm - 2profile - better - customizaConSet](https://docs.google.com/spreadsheets/d/1cbLkXNj2Nv5Erb4qJ-bofXix7H1UAu_WXZP_0gF-ycY/edit#gid=2061700494).

## Overall Cpu Utilization
Overall cpu utilization comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, different -R, according to the data in the upper excel [Latency of HotelReservation Swarm - 2profile - better - customizaConSet](https://docs.google.com/spreadsheets/d/1cbLkXNj2Nv5Erb4qJ-bofXix7H1UAu_WXZP_0gF-ycY/edit#gid=2061700494)

Cpu utilization of all the swarm data: container swarm + firecracker swarm
![CPU_Utilization_Swarm_2Profile_Better_CustomizaConSet](CPU_Utilization_hotel_Swarm_2Profile_Better_CustomizaConSet.png)
Cpu utilization of all the container data:
![CPU_Utilization_Swarm_2Profile_Better_CustomizaConSet_Container](CPU_Utilization_hotel_Swarm_2Profile_Better_CustomizaConSet_container.png)
Cpu utilization of all the firecracker data:
![CPU_Utilization_Swarm_2Profile_Better_CustomizaConSet_Firecracker](CPU_Utilization_hotel_Swarm_2Profile_Better_CustomizaConSet_firecracker.png)

## Avg Latency
Avg Latency comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, dirrerent -R, according to the data in the upper excel [Latency of HotelReservation Swarm - 2profile - better - customizaConSet](https://docs.google.com/spreadsheets/d/1cbLkXNj2Nv5Erb4qJ-bofXix7H1UAu_WXZP_0gF-ycY/edit#gid=2061700494)

![Avg_Latency_Swarm_2Profile_Better_CustomizaConSet](Avg_Latency_hotel_Swarm_2Profile_Better_CustomizaConSet.jpg)

## Mpstat-UsrSysEtc
The mpstat result,under the condition: t_10_c_30_frontCore_4_wrk_1, -R 800, compare the UsrSysEtc result of "container set" in machine 1 and machine 2

![Mpstat_UsrSysEtc_Container_Swarm_setCore_R800_2Profile_Better_CustomizaConSet](mpstat_UsrSysEtc-container-Swarm-setCore-R-800-2Profile_Better_CustomizaConSet.jpg)

The mpstat result,under the condition: t_10_c_30_frontCore_4_wrk_1, -R 800, compare the UsrSysEtc result of "firecracker set" in machine 1 and machine 2

![Mpstat_UsrSysEtc_Firecracker_Swarm_setCore_R800_2Profile_Better_CustomizaConSet](mpstat_UsrSysEtc-firecracker-Swarm-setCore-R-800-2Profile_Better_CustomizaConSet.jpg)


## VMs - Corresponding cores, master machine
* consul \ -—-—----------------—------------------ core 0
* hotel-reserv-geo \ —---------------------------- core 2
* hotel-reserv-recommendation \ -——-—------------- core 4
* hotel-reserv-user \ —-------------—------------- core 6
* hotel-reserv-jaeger \ ----------—--------------- core 8

* hotel-reserv-profile ---—----------------------- core 10, 12
* hotel-reserv-search --—------------------------- core 14, 16
* hotel-reserv-rate —----------------------------- core 18, 20
* hotel-reserv-reservation —---------------------- core 22, 24

* hotel-frontend --------------------------------------- core 1, 3, 5, 7

## VMs - Corresponding cores, secondary machine
* hotel-reserv-rate-mmc \ ---------—-------------- core 0
* hotel-reserv-profile-mmc \ ----------—---------- core 2
* hotel-reserv-geo-mongo \ ----------—------------ core 4
* hotel-reserv-profile-mongo \ ------------------- core 6
* hotel-reserv-rate-mongo \ -----------—---------- core 8
* hotel-reserv-recommendation-mongo -------------- core 10
* hotel-reserv-user-mongo  ----------------------- core 12

* hotel-reserv-reservation-mmc —---—---------------core 14, 16
* hotel-reserv-reservation-mongo \ --------------- core 18, 20, 22, 24(这个本来只需要一个core，而且本身cpu利用率非常少，是和别的叠在一起的，但是两个机子container swarm random的时候会挂掉，所以给4个core)(有特别处理了一下setCore尽量均匀一点)(~~spid数目是变化的，一开始容器创建好是34，当wrk开始后会涨到63，然后会变成64，到最后wrk结束保持在一共64个spid不变~~）



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
