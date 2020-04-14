%SEIR模型
clear;clc;
%初始值设置
%%%意大利2月27号开始，总人口2424e4
%%感染人数
%%[139 245 388 593 978 1501 2336 2922 3513 4747 5823 6566  7161 8042 9000 10075 11364 12729 13938 14991]
%%治愈人数
%%[49 49 73 123 175 291 291 552 739 913 1669 2134 2394 2731 2959 2959 2959 2959 4590 4590]

%%%
N=8043e4;%易感染者
E=8042-6565;%潜伏者
I=6565;%初始感染人群
Sq=520000;%初始隔离的易感人数
Eq=400;%初始隔离的暴露人数
H=500;%初始隔离的感染人群
R=2134;%初始康复人
S=N-E-I-R;
%参数设置
c=3.8;%接触率
beta=0.95e-9;%传染率
q=9.05e-7;%接触者隔离率
sigma=1/7;%1/7接触者转化为感染着的概率
lambda=1/28;%1/14隔离者的释放概率
deltaI=0.04;%有症状感染者向隔离感染者的转化率
deltaq=0.12;%隔离感染着向隔离感染者的转化率
gammaI=0.055;%感染者恢复率
gammaH=0.02;%隔离感染者恢复率
alpha=0.02;%致死率
%%%%%%

T=0:40;
for idx =1:length(T)-1
    S(idx+1)=S(idx)-c*(beta+q*(1-beta))*S(idx)*(I(idx)+E(idx))+lambda*Sq(idx);
    E(idx+1)=E(idx)+beta*c*(1-q)*S(idx)*(I(idx)+E(idx))-sigma*E(idx);
    I(idx+1)=I(idx)+sigma*E(idx)-(deltaI+alpha+gammaI)*I(idx);
    Sq(idx+1)=Sq(idx)+(1-beta)*c*q*S(idx)*(I(idx)+E(idx))-lambda*Sq(idx);
    Eq(idx+1)=Eq(idx)+beta*c*q*S(idx)*(I(idx)+E(idx))-deltaq*Eq(idx);
    H(idx+1)=H(idx)+deltaI*I(idx)+deltaq*Eq(idx)-(alpha+gammaH)*H(idx);
    R(idx+1)=R(idx)+gammaI*I(idx)+gammaH*H(idx); 
end


plot(T,I,T,R,'LineWidth',5);
grid on;
xlabel('days','LineWidth',5);
ylabel('number of cases','LineWidth',5);
hold on;
data_Infected=[6565 7161 8042 9000 10075 11364 12729 13938 14991  16169 17361 18407]';
data_Cured=[2134 2394 2731 2959 2959 2959 2959 4590 4590 5389 5389 5710]';
plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Iran after 2010-3-8','LineWidth',5);
% title('Prediction results of Iran after 2010-3-8');