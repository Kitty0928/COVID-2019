%SEIR模型
clear;clc;
%参数设置
%%real data
%%Germany
%confirmed
% 0 0 0 0 1 4 4 4 5 8 10 12 12 12 12 13 13 14 14 16 16 16 16 16 16 16 16  16 16 16 16 16 16 17 27 46 48 79 130 159 196 262 482 670 799 1040
%cured
%0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 9 9 9 9 12 12 12 13 18 18 22 22 22 22 22 22 22 22 32 32 32 43 43 43
N=8293e4;%人口数
I=79;%感染者
R=22;%康复者
D=5;%死亡患者数量
E=400;%潜伏者
S=N-I-R-E;%易感染者
r=1.1;%接触病患的人数
a=0.958;%潜伏者患病概率
B=0.075;%感染概率
y=1/30;%康复概率
k=0.001;
T=3:500;
for idx =1:length(T)-1
    S(idx+1)=S(idx)-r*B*I(idx)*S(idx)/N;%易感人数迭代
    E(idx+1)=E(idx)+r*B*S(idx)*I(idx)/N-a*E(idx);%潜伏者人数迭代
    I(idx+1)=I(idx)+a*E(idx)-(y+k)*I(idx);%患病人数迭代
    R(idx+1)=R(idx)+y*I(idx);%康复人数迭代 
    D(idx+1)=D(idx)+k*I(idx);%死亡患者人数迭代
end

plot(T,I,T,R,T,S,T,D,'LineWidth',5);
grid on;
xlabel('days','LineWidth',5);
ylabel('number of cases','LineWidth',5);
hold on;
data_Infected=[27 46 48 79 130 159 196 262 482 670 799 1040]';
data_Cured=[22 22 22 22 22 22 32 32 32 43 43 43]';
plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Germany','LineWidth',5);