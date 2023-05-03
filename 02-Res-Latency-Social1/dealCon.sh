#dealCon.sh
#!/bin/bash

echo "compose Posts"
for fcId in \
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_200\
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_400\
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_800\
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_1000\
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_1200\
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_1500\
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_2000\
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_2400\
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_3000\
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_3700\
	container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_4000
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

# echo " "
# echo "Read Home Timelines"
# for fcId in \
# 	container_t_4_c_6_readHomeTimeline_composeCore_1_wrkCore_1\
# 	container_t_4_c_6_readHomeTimeline_composeCore_1_wrkCore_2\
# 	container_t_4_c_6_readHomeTimeline_composeCore_2_wrkCore_1\
# 	container_t_4_c_6_readHomeTimeline_composeCore_2_wrkCore_2\
# 	container_t_4_c_6_readHomeTimeline_composeCore_4_wrkCore_1\
# 	container_t_4_c_6_readHomeTimeline_composeCore_4_wrkCore_2\
# 	container_t_4_c_6_readHomeTimeline_composeCore_6_wrkCore_1\
# 	container_t_4_c_6_readHomeTimeline_composeCore_6_wrkCore_2\
# 	container_t_4_c_6_readHomeTimeline_composeCore_8_wrkCore_1\
# 	container_t_4_c_6_readHomeTimeline_composeCore_8_wrkCore_2\
# 	container_t_10_c_30_readHomeTimeline_composeCore_1_wrkCore_1\
# 	container_t_10_c_30_readHomeTimeline_composeCore_1_wrkCore_2\
# 	container_t_10_c_30_readHomeTimeline_composeCore_2_wrkCore_1\
# 	container_t_10_c_30_readHomeTimeline_composeCore_2_wrkCore_2\
# 	container_t_10_c_30_readHomeTimeline_composeCore_4_wrkCore_1\
# 	container_t_10_c_30_readHomeTimeline_composeCore_4_wrkCore_2\
# 	container_t_10_c_30_readHomeTimeline_composeCore_6_wrkCore_1\
# 	container_t_10_c_30_readHomeTimeline_composeCore_6_wrkCore_2\
# 	container_t_10_c_30_readHomeTimeline_composeCore_8_wrkCore_1\
# 	container_t_10_c_30_readHomeTimeline_composeCore_8_wrkCore_2
# do 
# 	echo $fcId
# 	cd $fcId
# 	cat wrk.txt|grep "Thread Stats"
# 	cat wrk.txt|grep "Latency  "
# 	cat wrk.txt|grep "Req/Sec " 
# 	cat wrk.txt|grep "#\[Mean    =         -nan"
# 	echo "----------#----------------#----------------"
# 	cat wrk.txt|grep "Socket errors"
# 	cat wrk.txt|grep "Non-2xx or 3xx"
# 	cat wrk.txt|grep "requests "
# 	cat wrk.txt|grep "Requests/sec"
# 	cat wrk.txt|grep "Transfer/sec"
# 	echo ""
# 	cd ..
# done



# echo " "
# echo "Read User Timelines"
# for fcId in \
# 	container_t_4_c_6_readUserTimeline_composeCore_1_wrkCore_1\
# 	container_t_4_c_6_readUserTimeline_composeCore_1_wrkCore_2\
# 	container_t_4_c_6_readUserTimeline_composeCore_2_wrkCore_1\
# 	container_t_4_c_6_readUserTimeline_composeCore_2_wrkCore_2\
# 	container_t_4_c_6_readUserTimeline_composeCore_4_wrkCore_1\
# 	container_t_4_c_6_readUserTimeline_composeCore_4_wrkCore_2\
# 	container_t_4_c_6_readUserTimeline_composeCore_6_wrkCore_1\
# 	container_t_4_c_6_readUserTimeline_composeCore_6_wrkCore_2\
# 	container_t_4_c_6_readUserTimeline_composeCore_8_wrkCore_1\
# 	container_t_4_c_6_readUserTimeline_composeCore_8_wrkCore_2\
# 	container_t_10_c_30_readUserTimeline_composeCore_1_wrkCore_1\
# 	container_t_10_c_30_readUserTimeline_composeCore_1_wrkCore_2\
# 	container_t_10_c_30_readUserTimeline_composeCore_2_wrkCore_1\
# 	container_t_10_c_30_readUserTimeline_composeCore_2_wrkCore_2\
# 	container_t_10_c_30_readUserTimeline_composeCore_4_wrkCore_1\
# 	container_t_10_c_30_readUserTimeline_composeCore_4_wrkCore_2\
# 	container_t_10_c_30_readUserTimeline_composeCore_6_wrkCore_1\
# 	container_t_10_c_30_readUserTimeline_composeCore_6_wrkCore_2\
# 	container_t_10_c_30_readUserTimeline_composeCore_8_wrkCore_1\
# 	container_t_10_c_30_readUserTimeline_composeCore_8_wrkCore_2
# do 
# 	echo $fcId
# 	cd $fcId
# 	cat wrk.txt|grep "Thread Stats"
# 	cat wrk.txt|grep "Latency  "
# 	cat wrk.txt|grep "Req/Sec " 
# 	cat wrk.txt|grep "#\[Mean    =         -nan"
# 	echo "----------#----------------#----------------"
# 	cat wrk.txt|grep "Socket errors"
# 	cat wrk.txt|grep "Non-2xx or 3xx"
# 	cat wrk.txt|grep "requests "
# 	cat wrk.txt|grep "Requests/sec"
# 	cat wrk.txt|grep "Transfer/sec"
# 	echo ""
# 	cd ..
# done
