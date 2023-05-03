# Hotel Reservation Data - Swarm - 1profile

let 18 firecrackers, each set to different cores, from core 0,2,4,6,8…….20

set frontend to core 1 or above (basically core 1,3,5-more-15)

set wrk to core 31


Notice Container random Swarm didn't get wanted request/second!!!

Only Container set Swarm get wanted request/second in pic. (get request/second (-R) from 200 - 1500)

**这里container Swarm random会失败没有结果**
原因是hotel-reserv-reservation-mongo在一个机子上时候，本来只需要一个core，而且本身cpu利用率非常少，是和别的叠在一起的，但是两个机子container swarm random的时候还是给1个core会挂掉。

## Overall CPU Excel
Can see the overall CPU utilization, throughtput, BW etc. in this excel [Latency of HotelReservation Swarm - 1profile](https://docs.google.com/spreadsheets/d/1V2xNBc6SFpd61tMx0VRsOVSp7tgv5Kaim13BFBtLXWw/edit#gid=1045338351).

## Overall Cpu Utilization
Overall cpu utilization comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, different -R, according to the data in the upper excel [Latency of HotelReservation Swarm - 1profile](https://docs.google.com/spreadsheets/d/1V2xNBc6SFpd61tMx0VRsOVSp7tgv5Kaim13BFBtLXWw/edit#gid=1045338351)

Cpu utilization of all the swarm data: container swarm + firecracker swarm
![CPU_Utilization_1Profile](CPU_Utilization_hotel_Swarm_1profile.png)
Cpu utilization of all the container data:
![CPU_Utilization_1Profile_Container](CPU_Utilization_hotel_Swarm_1profile_container.png)
Cpu utilization of all the firecracker data:
![CPU_Utilization_1Profile_Firecracker](CPU_Utilization_hotel_Swarm_1profile_firecracker.png)

## Avg Latency
Avg Latency comparison,under the condition: t_10_c_30_frontCore_4_wrk_1, dirrerent -R, according to the data in the upper excel [Latency of HotelReservation Swarm - 1profile](https://docs.google.com/spreadsheets/d/1V2xNBc6SFpd61tMx0VRsOVSp7tgv5Kaim13BFBtLXWw/edit#gid=1045338351)

![Avg_Latency_1Profile](Avg_Latency_hotel_Swarm_1profile.jpg)

## Mpstat-UsrSysEtc
The mpstat result,under the condition: t_10_c_30_frontCore_4_wrk_1, -R 1000, compare the UsrSysEtc result of "container set" in machine 1 and machine 2

![Mpstat_UsrSysEtc_Container_Swarm_setCore_R1000_1Profile](mpstat_UsrSysEtc-container-Swarm-setCore-R-1000-1profile.jpg)

The mpstat result,under the condition: t_10_c_30_frontCore_4_wrk_1, -R 1000, compare the UsrSysEtc result of "firecracker set" in machine 1 and machine 2

![Mpstat_UsrSysEtc_Firecracker_Swarm_setCore_R1000_1Profile](mpstat_UsrSysEtc-firecracker-Swarm-setCore-R-1000-1profile.jpg)

## VMs - Corresponding cores, master machine
* consul \ -—-—----------------—------------------ core 0
* hotel-reserv-geo \ —---------------------------- core 2
* hotel-reserv-recommendation \ -——-—------------- core 4
* hotel-reserv-user \ —-------------—------------- core 6
* hotel-reserv-jaeger \ ----------—--------------- core 8

* hotel-reserv-profile ---—----------------------- core 10
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

* hotel-reserv-reservation-mongo \ --------------- core 12
* hotel-reserv-user-mongo  ----------------------- core 14

* hotel-reserv-reservation-mmc —---—---------------core 16, 18


## Generation Scrpts：
* test-CPU-randomCore-grayfox-latency-firecracker-swarm
* test-CPU-oddEvenCore-grayfox-latency-firecracker-swarm

## Data
- hotel-1profile-machine1
    - Res-container-random-Swarm-v1-machine1
    - Res-container-set-Swarm-v1-machine1
    - Res-firecracker-random-Swarm-v1-machine1
    - Res-firecracker-set-Swarm-v1-machine1

- hotel-1profile-machine2
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