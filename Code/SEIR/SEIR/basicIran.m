%SEIR模型
clear;clc;
%参数设置
%%real data
%%Japan
%confirmed
%0 2 5 18 28 43 61 95 139 245 388 593 978 1501 2336 2922 3513
%cured
%0 0 0 0 0 0 0 0 49 49 73 123 175 291 291 552 739
N=8180e4;%人口数
I=95;%传染者
R=49;%康复者
D=0;%死亡患者数量
E=1500;%潜伏者
S=N-I-R;%易感染者
r=1.1;%接触病患的人数
a=1/6;%潜伏者患病概率
B=0.106;%感染概率
y=1/20;%康复概率
k=0.005;
T=6:500;
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
data_Infected=[0 2 5 18 28 43 61 95 139 245 388 593 978 1501 2336 2922 3513]';
data_Cured=[0 0 0 0 0 0 0 0 49 49 73 123 175 291 291 552 739]';

plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Iran','LineWidth',5);