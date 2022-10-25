# Firecracker and Container Data of Hotel Reservation

Specific setting and detailed vm and core corresponding can see the README.md in the corresponding folder.

## Overall CPU Excel
Can see the overall CPU utilization, throughtput, BW etc. in the excels below:

- The [Summary of HotelReservation](https://docs.google.com/spreadsheets/d/1Wd_QWPUeXN8QmSJorNXnRjmlugQj44pf8u961l5VYDA/edit#gid=0).

- The [Summary of MediaMicroservices](https://docs.google.com/spreadsheets/d/15ZE8fhBdG4eqeoF4SKdlxhGHdEUOt4ycIA45QE0sNP0/edit#gid=0)

- The [Summary of SocialNetwork](https://docs.google.com/spreadsheets/d/19gUlqHa60Pn0a4oHwTuilKT-drm3XaGoNARrk3Cob7k/edit#gid=0)

- The [Latency of HotelReservation](https://docs.google.com/spreadsheets/d/1SAPFEOHZ8QP8jzDtzEEULMyZjnnBidJd21M3Xt4HAz8/edit#gid=0)

- The [Latency of MediaMicroservices](https://docs.google.com/spreadsheets/d/19FS-EyBTvXsegDJiu6z5GzgEC7pxxrHD69Eg7wujsFU/edit#gid=0)

- The [Latency of SocialNetwork1](https://docs.google.com/spreadsheets/d/1uyBNdEzSTrxeoCo0qvgatThFoAlMP8Mk3O8fM-V3YTg/edit#gid=0)

- The [Perf of HotelReservation](https://docs.google.com/spreadsheets/d/1TrBh9p-e5ZvEHpTV7RjCnJprcAX9USj5mwxQ-W7hJdI/edit#gid=0)

- The [Perf of MediaMicroservices](https://docs.google.com/spreadsheets/d/1zaOMOGnkU5PWuiPJSd_X1S7XV-J2tkXLZaWdLIcMfCQ/edit#gid=0)

- The [Perf of SocialNetwork1](https://docs.google.com/spreadsheets/d/1p-JXlBnkdgEr40PYGVKiHzCcRPLQTEYAuPCoLf1HOEs/edit#gid=0)

## Greaphs
### CPU related
Use `mpstat -P ALL 1` to generate "cpu_perf.txt".

Use fio_extract.py to deal data and get graphs.

- Graphs:
    - mpstat_all.png
    - mpstat_UsrSysEtc.png
    - mpstat_data_overtime.png (cpu utilization overtime)

mpstat_data_overtime.png is generated according to mpstat_data.csv in the same folder.

### Schedstat
Use `cat  /proc/schedstat` to generate "schedstat.txt".

Use schedstat_extract.py to deal data and get graphs.

Get the colume 7, 8, 9 of the cpu0 to 31
- Meaning
    - Colume 9 means: # of tasks (not necessarily unique) given to the processor or means: # of timeslices run on this cpu.
    - Can refer to http://eaglet.pdxhosts.com/rick/linux/schedstat/v15/format-15.html or https://docs.kernel.org/scheduler/sched-stats.html for detailed info of colume 7, colume 8.
- Graphs:
    - schedstat_fig_col_7.png
    - schedstat_fig_col_8.png
    - schedstat_fig_col_9.png

### Sched_debug
Use `cat /proc/sched_debug` to generate "schedDebug.txt".

Use schedDebug_extract.py to deal data and get graphs.

Get the `.nr_switches` of each core.
- Graphs:
    - schedDebug_fig.png

### Interrupts
Use `cat /proc/interrupts` to generate "interrupts.txt".

Use interrupts_extract.py to deal data and get graphs.

Get the `RES: ....... Rescheduling interrupts` of each core.
- Graphs:
    - interrupts_fig.png


### Mpstat_all_avg folder
In Res-Latency-*/mpstat_all_avg

This folder has the graph, compare the average CPU Utilization of four different conditions: 
- Container Random, 
- Container Set, 
- Firecracker Random, 
- Firecracker set, 
under the specific -R(Requests/sec) parameter