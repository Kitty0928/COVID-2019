%SEIR模型
clear;clc;
%参数设置
%%real data
%%Korea
%confirmed
%3 4 4 4 4 11 12 15 15 16 19 23 24 24 25 27 28 28 28 28 28 29 30 31 31 104 204 433 602 833 977 1261 1766 2337 3150 3736 4335 5186 5621 6088 6593 7041 7314
%cured
%0 0 0 0 0 0 0 0 0 0 0 0 1 1 3 3 3 7 7 7 9 9 10 12 12 16 16 16 18 18 22 22 22 22 27 30 30 30 41 41 135 135 118
%korea
%Italy
%Iran
%confirmed
%0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 5 18 28 43 61 95 139 245 388 593 978 1501 2336 2922 3513
%cured
% 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 49 49 73 123 175 291 291 552 739
N=5164e4;%人口数
I=833;%传染者
R=18;%康复者
D=0;%死亡患者数量
E=3900;%潜伏者
S=N-I-E-R;%易感染者
r=1.15;%接触病患的人数
a=0.825;%潜伏者患病概率
B=0.0525;%感染概率
y=1/32;%康复概率
k=0.0025;
T=0:500;
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
data_Infected=[104 204 433 602 833 977 1261 1766 2337 3150 3736 4335 5186 5621 6088 6593 7041 7314]';
data_Cured=[16 16 16 18 18 22 22 22 22 27 30 30 30 41 41 135 135 118]';

plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of South Korea','LineWidth',5);