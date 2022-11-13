#dealFire.sh
#!/bin/bash

echo "compose Posts"
for fcId in \
	firecracker_t_4_c_6_composePosts_composeVcpu_1_wrkVcpu_1\
	firecracker_t_4_c_6_composePosts_composeVcpu_1_wrkVcpu_2\
	firecracker_t_4_c_6_composePosts_composeVcpu_2_wrkVcpu_1\
	firecracker_t_4_c_6_composePosts_composeVcpu_2_wrkVcpu_2\
	firecracker_t_4_c_6_composePosts_composeVcpu_4_wrkVcpu_1\
	firecracker_t_4_c_6_composePosts_composeVcpu_4_wrkVcpu_2\
	firecracker_t_4_c_6_composePosts_composeVcpu_6_wrkVcpu_1\
	firecracker_t_4_c_6_composePosts_composeVcpu_6_wrkVcpu_2\
	firecracker_t_4_c_6_composePosts_composeVcpu_8_wrkVcpu_1\
	firecracker_t_4_c_6_composePosts_composeVcpu_8_wrkVcpu_2\
	firecracker_t_10_c_30_composePosts_composeVcpu_1_wrkVcpu_1\
	firecracker_t_10_c_30_composePosts_composeVcpu_1_wrkVcpu_2\
	firecracker_t_10_c_30_composePosts_composeVcpu_2_wrkVcpu_1\
	firecracker_t_10_c_30_composePosts_composeVcpu_2_wrkVcpu_2\
	firecracker_t_10_c_30_composePosts_composeVcpu_4_wrkVcpu_1\
	firecracker_t_10_c_30_composePosts_composeVcpu_4_wrkVcpu_2\
	firecracker_t_10_c_30_composePosts_composeVcpu_6_wrkVcpu_1\
	firecracker_t_10_c_30_composePosts_composeVcpu_6_wrkVcpu_2\
	firecracker_t_10_c_30_composePosts_composeVcpu_8_wrkVcpu_1\
	firecracker_t_10_c_30_composePosts_composeVcpu_8_wrkVcpu_2

do 
	echo $fcId
	cd $fcId
	cat wrk.txt|grep "Thread Stats"
	cat wrk.txt|grep "Latency  "
	cat wrk.txt|grep "Req/Sec " 
	cat wrk.txt|grep "#\[Mean    =         -nan"
	echo "----------#----------------#----------------"
	cat wrk.txt|grep "Socket errors"
	cat wrk.txt|grep "Non-2xx or 3xx"
	cat wrk.txt|grep "requests "
	cat wrk.txt|grep "Requests/sec"
	cat wrk.txt|grep "Transfer/sec"
	echo ""
	cd ..
done

echo " "
echo "Read Home Timelines"
for fcId in \
	firecracker_t_4_c_6_readHomeTimeline_composeVcpu_1_wrkVcpu_1\
	firecracker_t_4_c_6_readHomeTimeline_composeVcpu_1_wrkVcpu_2\
	firecracker_t_4_c_6_readHomeTimeline_composeVcpu_2_wrkVcpu_1\
	firecracker_t_4_c_6_readHomeTimeline_composeVcpu_2_wrkVcpu_2\
	firecracker_t_4_c_6_readHomeTimeline_composeVcpu_4_wrkVcpu_1\
	firecracker_t_4_c_6_readHomeTimeline_composeVcpu_4_wrkVcpu_2\
	firecracker_t_4_c_6_readHomeTimeline_composeVcpu_6_wrkVcpu_1\
	firecracker_t_4_c_6_readHomeTimeline_composeVcpu_6_wrkVcpu_2\
	firecracker_t_4_c_6_readHomeTimeline_composeVcpu_8_wrkVcpu_1\
	firecracker_t_4_c_6_readHomeTimeline_composeVcpu_8_wrkVcpu_2\
	firecracker_t_10_c_30_readHomeTimeline_composeVcpu_1_wrkVcpu_1\
	firecracker_t_10_c_30_readHomeTimeline_composeVcpu_1_wrkVcpu_2\
	firecracker_t_10_c_30_readHomeTimeline_composeVcpu_2_wrkVcpu_1\
	firecracker_t_10_c_30_readHomeTimeline_composeVcpu_2_wrkVcpu_2\
	firecracker_t_10_c_30_readHomeTimeline_composeVcpu_4_wrkVcpu_1\
	firecracker_t_10_c_30_readHomeTimeline_composeVcpu_4_wrkVcpu_2\
	firecracker_t_10_c_30_readHomeTimeline_composeVcpu_6_wrkVcpu_1\
	firecracker_t_10_c_30_readHomeTimeline_composeVcpu_6_wrkVcpu_2\
	firecracker_t_10_c_30_readHomeTimeline_composeVcpu_8_wrkVcpu_1\
	firecracker_t_10_c_30_readHomeTimeline_composeVcpu_8_wrkVcpu_2
do 
	echo $fcId
	cd $fcId
	cat wrk.txt|grep "Thread Stats"
	cat wrk.txt|grep "Latency  "
	cat wrk.txt|grep "Req/Sec " 
	cat wrk.txt|grep "#\[Mean    =         -nan"
	echo "----------#----------------#----------------"
	cat wrk.txt|grep "Socket errors"
	cat wrk.txt|grep "Non-2xx or 3xx"
	cat wrk.txt|grep "requests "
	cat wrk.txt|grep "Requests/sec"
	cat wrk.txt|grep "Transfer/sec"
	echo ""
	cd ..
done




echo " "
echo "Read User Timelines"
for fcId in \
	firecracker_t_4_c_6_readUserTimeline_composeVcpu_1_wrkVcpu_1\
	firecracker_t_4_c_6_readUserTimeline_composeVcpu_1_wrkVcpu_2\
	firecracker_t_4_c_6_readUserTimeline_composeVcpu_2_wrkVcpu_1\
	firecracker_t_4_c_6_readUserTimeline_composeVcpu_2_wrkVcpu_2\
	firecracker_t_4_c_6_readUserTimeline_composeVcpu_4_wrkVcpu_1\
	firecracker_t_4_c_6_readUserTimeline_composeVcpu_4_wrkVcpu_2\
	firecracker_t_4_c_6_readUserTimeline_composeVcpu_6_wrkVcpu_1\
	firecracker_t_4_c_6_readUserTimeline_composeVcpu_6_wrkVcpu_2\
	firecracker_t_4_c_6_readUserTimeline_composeVcpu_8_wrkVcpu_1\
	firecracker_t_4_c_6_readUserTimeline_composeVcpu_8_wrkVcpu_2\
	firecracker_t_10_c_30_readUserTimeline_composeVcpu_1_wrkVcpu_1\
	firecracker_t_10_c_30_readUserTimeline_composeVcpu_1_wrkVcpu_2\
	firecracker_t_10_c_30_readUserTimeline_composeVcpu_2_wrkVcpu_1\
	firecracker_t_10_c_30_readUserTimeline_composeVcpu_2_wrkVcpu_2\
	firecracker_t_10_c_30_readUserTimeline_composeVcpu_4_wrkVcpu_1\
	firecracker_t_10_c_30_readUserTimeline_composeVcpu_4_wrkVcpu_2\
	firecracker_t_10_c_30_readUserTimeline_composeVcpu_6_wrkVcpu_1\
	firecracker_t_10_c_30_readUserTimeline_composeVcpu_6_wrkVcpu_2\
	firecracker_t_10_c_30_readUserTimeline_composeVcpu_8_wrkVcpu_1\
	firecracker_t_10_c_30_readUserTimeline_composeVcpu_8_wrkVcpu_2
do 
	echo $fcId
	cd $fcId
	cat wrk.txt|grep "Thread Stats"
	cat wrk.txt|grep "Latency  "
	cat wrk.txt|grep "Req/Sec " 
	cat wrk.txt|grep "#\[Mean    =         -nan"
	echo "----------#----------------#----------------"
	cat wrk.txt|grep "Socket errors"
	cat wrk.txt|grep "Non-2xx or 3xx"
	cat wrk.txt|grep "requests "
	cat wrk.txt|grep "Requests/sec"
	cat wrk.txt|grep "Transfer/sec"
	echo ""
	cd ..
done
