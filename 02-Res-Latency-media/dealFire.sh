#dealFire.sh
#!/bin/bash

for fcId in \
	firecracker_t_10_c_30_composeReviewServiceCore_4_wrkVcpu_1_R_100\
	firecracker_t_10_c_30_composeReviewServiceCore_4_wrkVcpu_1_R_200\
	firecracker_t_10_c_30_composeReviewServiceCore_4_wrkVcpu_1_R_400\
	firecracker_t_10_c_30_composeReviewServiceCore_4_wrkVcpu_1_R_600\
	firecracker_t_10_c_30_composeReviewServiceCore_4_wrkVcpu_1_R_800
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
