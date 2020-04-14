#法国
from scipy.optimize import curve_fit
import numpy as np
import matplotlib.pyplot as plt
import pandas as pd
 
 
def logistic_growth_function(t, K, P0, r):
    t0 = 0
    exp = np.exp(r * (t - t0))
    return (K * exp * P0) / (K + (exp - 1) * P0)
 
def predict():
    # 预测未来天数
    predict_feature_days = 35

#法国
    confirm_per_day = [100, 130 ,191, 204, 285 ,377, 653 ,949, 1126,1209, 1784, 2281,2281, 3661, 4469, 4499, 6633, 7652, 9043, 10871, 12612]

    n = np.arange(len(confirm_per_day))
 
    # 用最小二乘法估计拟合
    popt, pcov = curve_fit(logistic_growth_function, n, confirm_per_day,maxfev = 5000)
    print("popt =",popt)
 
    #近期情况预测
    predict_n = list(n) + [n[-1] + i for i in range(1, 1 + predict_feature_days)]
    predict_n = np.array(predict_n)
    predict_y = logistic_growth_function(predict_n, popt[0], popt[1], popt[2])
    print(predict_y)
 
    #绘图
    plt.figure(figsize=(15, 8))
    plt.plot(n, confirm_per_day, 's',label="Confimed")
    plt.plot(predict_n, predict_y, 's',label="Predicted")
    plt.xticks(predict_n, np.arange(len(predict_n))+1, rotation=90)
    plt.yticks(rotation=90)
 
    plt.suptitle("France fitting curve for confirmed cases(Max = {},  r={:.3})".format(int(popt[0]), popt[2]), fontsize=16, fontweight="bold")
    plt.xlabel('days', fontsize=14)
    plt.ylabel('number of cases', fontsize=14)
    plt.legend()
    plt.plot()
    plt.savefig("./France.tiff")
 
predict()