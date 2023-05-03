# Hotel Reservation Data - Swarm - 1profile - better

let 18 firecrackers, each set to different cores, from core 0,2,4,6,8…….20

set frontend to core 1 or above (basically core 1,3,5-more-15)

set wrk to core 31

Notice Container random Swarm can get wanted request/second!!! But I cannot reproduce this data after reboot graymob!!!

## Overall CPU Excel
Can see the overall CPU utilization, throughtput, BW etc. in this excel [Latency of HotelReservation Swarm - 1profile - better](https://docs.google.com/spreadsheets/d/1_t2eJdry_HFz5YUytr2Qc2vPFCRCXc6_pGuTCbmx8jA/edit#gid=1045338351).

## Overall Cpu Utilization
Overall cpu utilization comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, different -R, according to the data in the upper excel [Latency of HotelReservation Swarm - 1profile - better](https://docs.google.com/spreadsheets/d/1_t2eJdry_HFz5YUytr2Qc2vPFCRCXc6_pGuTCbmx8jA/edit#gid=1045338351)

Cpu utilization of all the swarm data: container swarm + firecracker swarm
![CPU_Utilization_1Profile_Better](CPU_Utilization_hotel_Swarm_1profile_better.png)
Cpu utilization of all the container data:
![CPU_Utilization_1Profile_Container_Better](CPU_Utilization_hotel_Swarm_1profile_container_better.png)
Cpu utilization of all the firecracker data:
![CPU_Utilization_1Profile_Firecracker_Better](CPU_Utilization_hotel_Swarm_1profile_firecracker_better.png)

## Avg Latency
Avg Latency comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, dirrerent -R, according to the data in the upper excel [Latency of HotelReservation Swarm - 1profile - better](https://docs.google.com/spreadsheets/d/1_t2eJdry_HFz5YUytr2Qc2vPFCRCXc6_pGuTCbmx8jA/edit#gid=1045338351)

![Avg_Latency_1Profile_Better](Avg_Latency_hotel_Swarm_1profile_better.jpg)

## Mpstat-UsrSysEtc
The mpstat result,under the condition: t_10_c_30_frontCore_4_wrk_1, -R 1000, compare the UsrSysEtc result of "container set" in machine 1 and machine 2

![Mpstat_UsrSysEtc_Container_Swarm_setCore_R1000_1Profile_Better](mpstat_UsrSysEtc-container-Swarm-setCore-R-1000-1profile-better.jpg)

The mpstat result,under the condition: t_10_c_30_frontCore_4_wrk_1, -R 1000, compare the UsrSysEtc result of "firecracker set" in machine 1 and machine 2

![Mpstat_UsrSysEtc_Firecracker_Swarm_setCore_R1000_1Profile_Better](mpstat_UsrSysEtc-firecracker-Swarm-setCore-R-1000-1profile-better.jpg)

## Difference between 1 profile and 1 profile - better (01 vs 02)
- 测一个机子情况的时候，原本叠加在core 20上的 hotel-reserv-recommendation-mongo (20)，hotel-reserv-reservation-mongo(13,15)，hotel-reserv-user-mongo(22)分开放在不同的core上了；
- profile依旧被动设置一个core;
- machine 2 上的hotel-reserv-reservation-mongo给了2个core,从在core 14上变成分布在core 14，16上。

## VMs - Corresponding cores, master machine
* consul \ -—-—----------------—------------------ core 0
* hotel-reserv-geo \ —---------------------------- core 2
* hotel-reserv-recommendation \ -——-—------------- core 4
* hotel-reserv-user \ —-------------—------------- core 6
* hotel-reserv-jaeger \ ----------—--------------- core 8

* hotel-reserv-profile ---—----------------------- core 10(这个本来设置2个core的，但是在两个机子上跑firecracker时候会挂掉，所以给一个core)
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

* hotel-reserv-reservation-mongo \ --------------- core 14, 16(这个本来只需要一个core，而且本身cpu利用率非常少，是和别的叠在一起的，但是两个机子container swarm random的时候会挂掉，所以给2个core)
* hotel-reserv-reservation-mmc —---—---------------core 18, 20


## Generation Scrpts：
* test-CPU-randomCore-grayfox-latency-firecracker-swarm
* test-CPU-oddEvenCore-grayfox-latency-firecracker-swarm

## Data
- hotel-1profile-machine1-better
    - Res-container-random-Swarm-v1-machine1
    - Res-container-set-Swarm-v1-machine1
    - Res-firecracker-random-Swarm-v1-machine1
    - Res-firecracker-set-Swarm-v1-machine1

- hotel-1profile-machine2-better
    - Res-container-random-Swarm-v1-machine2
    - Res-container-set-Swarm-v1-machine2
    - Res-firecracker-random-Swarm-v1-machine2
    - Res-firecracker-set-Swarm-v1-machine2

## Difference of Swarm and non-Swarm
* Swarm mode set vms to 2 machines / ori container test only on one machine
* Swarm don't have vms set to one same core 
* Swam record the BW of the physical network card 

## Modification needed in Deal Data Scripts
- In order to let fio_extract.py works properly
    - "AM" generated in machine 2's cpu_perf.txt should be removed
    - The cpu_perf.txt's last line may finished in the middle, should manually delete the uncomplete line in the end
- draw_mpstat_all_avg.py should be modified.
    - File name has been modified, so the path in line 21-24 shuold be modified
    - Title in line 76 can be modified
    - X coordinate in line 80 must been changed