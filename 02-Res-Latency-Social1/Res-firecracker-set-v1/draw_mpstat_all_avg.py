import os
import re
from decimal import *
import numpy as np
import pandas as pd
import random
import matplotlib.pyplot as plt
import matplotlib.ticker as mticker

folder = os.getcwd()+'/mpstat_all_avg'
if not os.path.exists(folder):
  os.makedirs(folder)

def mpstatAllAvg(n):
  filenames = ['Res-container-random-v1/container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_{}/mpstat_all_Avg.txt'.format(n), \
              'Res-container-set-v1/container_t_10_c_30_composePosts_composeCore_4_wrkCore_1_R_{}/mpstat_all_Avg.txt'.format(n), \
              'Res-firecracker-random-v1/firecracker_t_10_c_30_composePosts_composeVcpu_4_wrkVcpu_1_R_{}/mpstat_all_Avg.txt'.format(n), \
              'Res-firecracker-set-v1/firecracker_t_10_c_30_composePosts_composeVcpu_4_wrkVcpu_1_R_{}/mpstat_all_Avg.txt'.format(n)]
  mpstat_csv_path = os.path.join('.', folder, 'mpstat_all_avg_R_{}.txt'.format(n))
  with open(mpstat_csv_path, 'w') as outfile:
      for fname in filenames:
          with open(fname) as infile:
              for line in infile:
                  outfile.write(line)
                  outfile.write('\n')


  # 下面几行把文件'mpstat_all.txt'里面内容行列转换
  data = pd.read_table(mpstat_csv_path,sep=',',encoding='utf_8_sig',engine='python',header=None) #pd.read_table返回一个数据结构DataFrame
  T=data.T #行列转换
  # print(T)
  T.to_csv(mpstat_csv_path,sep=',',index=False,header=None)
#行列转换后得到result.txt
#Container random的60秒平均 usr%, Container set的60秒平均 usr%， Firecracker random的60秒平均 usr%, Firecracker set的60秒平均 usr%
#Container random的60秒平均 sys%, Container set的60秒平均 sys%， Firecracker random的60秒平均 sys%, Firecracker set的60秒平均 sys%
#Container random的60秒平均 soft%, Container set的60秒平均 soft%， Firecracker random的60秒平均 soft%, Firecracker set的60秒平均 soft%
#Container random的60秒平均 guest%, Container set的60秒平均 guest%， Firecracker random的60秒平均 guest%, Firecracker set的60秒平均 guest%
#Container random的60秒平均 other%, Container set的60秒平均 other%， Firecracker random的60秒平均 other%, Firecracker set的60秒平均 other%
#Other就是=1-idle%-uer%-sys%-soft%-guest%

mpstatAllAvg(200)
mpstatAllAvg(400)
mpstatAllAvg(800)
mpstatAllAvg(1000)
mpstatAllAvg(1200)


#draw pictures，画堆叠柱状图
def mpstatAllAvgPng(n):

  mpstat_csv_path = os.path.join('.', folder, 'mpstat_all_avg_R_{}.txt'.format(n))
  if os.path.exists(mpstat_csv_path):
    outputs=[]
    plt.style.use('ggplot') #图的风格bmh、ggplot、dark_background、fivethirtyeight和grayscale。

    with open(mpstat_csv_path, 'r') as file:
      lines = file.readlines() #输出是string类型
      for line in lines:
        pieces=line.split(',')
        outputs.append(list(map(lambda n: float(n), pieces)))
      # print(outputs)
    rowNum = len(outputs) #有几行
    # print(rowNum)
    colNum = len(outputs[0]) #有几列
    # print(colNum)
    line0=outputs[0]
    # print(line0)

    plt.cla() #清空坐标轴
    plt.title('mpstat Cpu utilization-all-avg R_{}'.format(n))

    ind = np.arange(colNum)  #[ 0  1  2  3...31]
    plt.xticks(ind, ('Container\nRandom', 'Container\nSet', 'Firecracker\nRandom', 'Firecracker\nSet'))#, rotation='vertical'

    plt.ylabel('Avg cpu utilization (%)')
    plt.xlabel('Contidions') #横坐标名
    # plt.xticks(rotation=45)
    plt.ylim((0,100)) #坐标轴范围

    Bottom = outputs[4] #other
    Center3 = outputs[3] #guest
    Center2 = outputs[2] #soft
    Center1 = outputs[1] #sys
    Top = outputs[0] #usr

    bottom1 = []
    bottom2 = []
    bottom3 = []
    for i in range(0, len(Bottom)):
      sum1 = Bottom[i] + Center3[i]
      sum2 = Bottom[i] + Center3[i] + Center2[i]
      sum3 = Bottom[i] + Center3[i] + Center2[i] + Center1[i]
      bottom1.append(sum1)
      bottom2.append(sum2)
      bottom3.append(sum3)

    width = 0.7  # 设置条形图一个长条的宽度
    p1 = plt.bar(ind, Bottom, width, color='orangered') 
    p2 = plt.bar(ind, Center3, width, bottom=Bottom,color='limegreen') 
    p3 = plt.bar(ind, Center2, width, bottom=bottom1,color='darkorange')
    p4 = plt.bar(ind, Center1, width, bottom=bottom2,color='skyblue') 
    p5 = plt.bar(ind, Top, width, bottom=bottom3,color='lightcoral')

    plt.legend((p5[0], p4[0], p3[0], p2[0], p1[0]), ('usr', 'sys', 'soft', 'guest', 'other'),loc='lower left', bbox_to_anchor=(1.01,0))
    # plt.show()
    mpstat_fig_path = os.path.join('.', folder, 'mpstat_all_avg_R_{}.png'.format(n))
    # print(sch_fig_path)

    fig=plt.figure(1) #解决1
    fig.savefig(mpstat_fig_path, bbox_inches='tight') #解决1

mpstatAllAvgPng(200)
mpstatAllAvgPng(400)
mpstatAllAvgPng(800)
mpstatAllAvgPng(1000)
mpstatAllAvgPng(1200)