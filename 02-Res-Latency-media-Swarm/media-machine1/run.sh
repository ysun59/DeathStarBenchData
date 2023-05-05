#dealFire.sh
#!/bin/bash

cp dealCon.sh Res-container-random-Swarm-v1-machine1
cp dealCon.sh Res-container-set-Swarm-v1-machine1
cp dealFire.sh Res-firecracker-random-Swarm-v1-machine1
cp dealFire.sh Res-firecracker-set-Swarm-v1-machine1

for folder in \
    Res-container-random-Swarm-v1-machine1 \
    Res-container-set-Swarm-v1-machine1 \
    Res-firecracker-random-Swarm-v1-machine1 \
    Res-firecracker-set-Swarm-v1-machine1
do
    cp *.py $folder
    cd $folder
    echo "################################## start $folder #####################################################"
    python3 fio_extract.py
    python3 interrupts_extract.py
    python3 schedDebug_extract.py
    python3 schedstat_extract.py
    cd ..
    echo "################################## finish $folder #####################################################"
    echo ""
done

python3 draw_mpstat_all_avg.py


# for dir in `find . -type d -maxdepth 1`; do cp {fans.in.txt,fans2.txt,fans3.txt,pro.txt} $dir; done;
# for file in `ls *.gz`; do tar -xzf $file; done