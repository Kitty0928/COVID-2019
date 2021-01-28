#US
from scipy.optimize import curve_fit
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
from matplotlib.ticker import FuncFormatter 
 
 
def logistic_growth_function(t, K, P0, r):
    t0 = 0
    exp = np.exp(r * (t - t0))
    return (K * exp * P0) / (K + (exp - 1) * P0)
 
def predict():
    # 预测未来天数
    predict_feature_days = 55

    confirm_per_day =[ 107, 184, 237, 403, 519, 589, 782, 1145, 1584, 2214, 2971, 3211, 4679, 6513, 9153, 13643, 20007, 25991, 34804, 45973, 56571, 68583, 86495, 105103, 124701, 143672, 165615, 192048, 217730, 248186, 280173, 313154, 341245, 371481, 402917, 434886, 469478, 503006, 532447, 559318, 585240, 613887, 643833, 675261, 708179, 735960, 761620, 790121, 816100, 845361, 878645, 912247, 944231, 971149, 994204, 1018950, 1046653, 1076323, 1110394, 1138570, 1163016, 1186303, 1210960, 1236037, 1263804, 1290687, 1315641, 1334685, 1354141, 1376823, 1397811, 1424941, 1450023, 1474187, 1492437, 1514460, 1535031, 1558734, 1583861, 1607949, 1629327, 1649389, 1667937, 1687244, 1705634, 1728330, 1752689, 1776531, 1795916, 1813448, 1834439, 1854437, 1875699, 1900769, 1923078, 1940659, 1958249, 1976464, 1997257, 2019935, 2045136, 2070461, 2090161, 2109973, 2133693, 2159245, 2187044, 2218476, 2251036, 2277433, 2308050, 2343205, 2378183, 2418044, 2463274, 2505748, 2545202, 2586113, 2631972, 2683112, 2737612, 2790743, 2836480, 2886342, 2931382, 2991455, 3050023, 3113250, 3181074, 3241100, 3300020, 3359307, 3426658, 3494087, 3571354, 3642859, 3706333, 3767978, 3829433, 3894014, 3964927, 4033597, 4107256, 4173596, 4228323, 4284833, 4350802, 4421427, 4489400, 4556331, 4614540, 4661823, 4707373, 4764691, 4817408, 4877251, 4935332, 4991268, 5037976, 5087617, 5134340, 5190563, 5242056, 5306406, 5354024, 5395799, 5431045, 5476283, 5522710, 5566781, 5615216, 5659837, 5694522, 5732164, 5770344, 5814518, 5860493, 5906565, 5953475, 5988770, 6023072, 6066374, 6106154, 6150016, 6200518, 6244970, 6276365, 6300622, 6327009, 6360212, 6396100, 6443652, 6485123, 6520122, 6553652, 6592584, 6630604, 6675338, 6723933, 6768119, 6804814, 6856884, 6895918, 6933548, 6977658, 7032712, 7078089, 7115008, 7148045]
    
    
    n = np.arange(len(confirm_per_day))
 
    # 用最小二乘法估计拟合
    popt, pcov = curve_fit(logistic_growth_function, n, confirm_per_day,maxfev = 500000)
#     np.savetxt("F:/AI/MYY/data/Stata/722/ConfirmData/data/Russia_popt.csv", popt, delimiter=',')
#     print("popt =",popt)
 
    #近期情况预测
    predict_n = list(n) + [n[-1] + i for i in range(1, 1 + predict_feature_days)]
    predict_n = np.array(predict_n)
    predict_y = logistic_growth_function(predict_n, popt[0], popt[1], popt[2])
    predict_y = np.round(predict_y)
#     print(predict_y)
    np.savetxt("F:/AI/MYY/data/Stata/0930/fig/Italy_predict_y.csv", predict_y, delimiter=',')
 
    #绘图
    plt.figure(figsize=(15, 8))
    plt.plot(n, confirm_per_day, 's',label="Confimed")
    plt.plot(predict_n, predict_y, 's',label="Predicted")
#     plt.xticks(predict_n, np.arange(len(predict_n))+1, rotation=90)
    plt.yticks(rotation=90)
    plt.xticks(rotation=90)
 
    plt.suptitle("US (Max = {},  r={:.3})".format(int(popt[0]), popt[2]), fontsize=25, fontweight="bold")
    plt.xlabel('days', fontsize=24)
    plt.ylabel('number of cases', fontsize=26)
    plt.legend(fontsize=24)
    
    def formatnum(x, pos):
        return '$%.1f$x$10^{5}$' % (x/100000)
    formatter = FuncFormatter(formatnum)
    plt.gca().yaxis.set_major_formatter(formatter)
    plt.xticks(rotation=0)
    plt.yticks(rotation=0)
    plt.xticks(fontsize=20)
    plt.yticks(fontsize=20)
    plt.plot()
    plt.savefig("F:/AI/MYY/data/Stata/0930/fig/US.tiff")
 
predict()