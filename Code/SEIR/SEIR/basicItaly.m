%SEIR模型
clear;clc;
%参数设置
%%real data
%%Italy
%confirmed
%155 229 322 453 655 888 1128 1694 2036 2502 3089 3858
%cured
%1 1 2 3 45 46 46 83 149 160 276 414
N=6043e4;%人口数
I=155;%传染者
R=1;%康复者
D=0;%死亡患者数量
E=1500;%潜伏者
S=N-I-R;%易感染者
c=1.1;%接触病患的人数
a=1/6;%潜伏者患病概率
B=0.0756;%感染概率
y=1/25;%康复概率
k=0.001;
T=5:500;
for idx =1:length(T)-1
    S(idx+1)=S(idx)-c*B*I(idx)*S(idx)/N;%易感人数迭代
    E(idx+1)=E(idx)+c*B*S(idx)*I(idx)/N-a*E(idx);%潜伏者人数迭代
    I(idx+1)=I(idx)+a*E(idx)-(y+k)*I(idx);%患病人数迭代
    R(idx+1)=R(idx)+y*I(idx);%康复人数迭代 
    D(idx+1)=D(idx)+k*I(idx);%死亡患者人数迭代
end

plot(T,I,T,R,T,S,T,D,'LineWidth',5);
grid on;
xlabel('days','LineWidth',5);
ylabel('number of cases','LineWidth',5);
hold on;
data_Infected=[3 3 3 20 62 155 229 322 453 655 888 1128 1694 2036 2502 3089 3858]';
data_Cured=[0 0 0 0 1 2 1 1 3 45 46 46 83 149 160 276 414]';

plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Italy','LineWidth',5);