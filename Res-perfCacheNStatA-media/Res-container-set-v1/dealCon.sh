#dealCon.sh
#!/bin/bash

for fcId in \
	container_t_4_c_6_composeReviewServiceCore_1_wrkCore_1\
	container_t_4_c_6_composeReviewServiceCore_1_wrkCore_2\
	container_t_4_c_6_composeReviewServiceCore_2_wrkCore_1\
	container_t_4_c_6_composeReviewServiceCore_2_wrkCore_2\
	container_t_4_c_6_composeReviewServiceCore_4_wrkCore_1\
	container_t_4_c_6_composeReviewServiceCore_4_wrkCore_2\
	container_t_4_c_6_composeReviewServiceCore_6_wrkCore_1\
	container_t_4_c_6_composeReviewServiceCore_6_wrkCore_2\
	container_t_4_c_6_composeReviewServiceCore_8_wrkCore_1\
	container_t_4_c_6_composeReviewServiceCore_8_wrkCore_2\
	container_t_10_c_30_composeReviewServiceCore_1_wrkCore_1\
	container_t_10_c_30_composeReviewServiceCore_1_wrkCore_2\
	container_t_10_c_30_composeReviewServiceCore_2_wrkCore_1\
	container_t_10_c_30_composeReviewServiceCore_2_wrkCore_2\
	container_t_10_c_30_composeReviewServiceCore_4_wrkCore_1\
	container_t_10_c_30_composeReviewServiceCore_4_wrkCore_2\
	container_t_10_c_30_composeReviewServiceCore_6_wrkCore_1\
	container_t_10_c_30_composeReviewServiceCore_6_wrkCore_2\
	container_t_10_c_30_composeReviewServiceCore_8_wrkCore_1\
	container_t_10_c_30_composeReviewServiceCore_8_wrkCore_2
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
