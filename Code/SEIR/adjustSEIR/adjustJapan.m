%SEIR模型
clear;clc;
%初始值设置
%%%日本2月27号开始，总人口12700e4
%%感染人数
%%[214 228 241 256 274 293 331 360 420 461 502 511 581 639 639 701 773 839 825]
%%治愈人数
%%[22 22 32 32 32 43 43 43 46 76 76 76 101 118 118 118 118 118 144]


%%%
N=12700e4;%易感染者
E=120;%潜伏者
I=214;%初始感染人群
Sq=20;%初始隔离的易感人数
Eq=100;%初始隔离的暴露人数
H=200;%初始隔离的感染人群
R=22;%初始康复人
S=N-E-I-R;
%参数设置
c=2.08;%接触率
beta=1.0e-9;%传染率
q=1.0e-5;%接触者隔离率
sigma=1/7;%1/7接触者转化为感染着的概率
lambda=1/16;%1/14隔离者的释放概率
deltaI=0.4;%有症状感染者向隔离感染者的转化率
deltaq=0.4;%隔离感染着向隔离感染者的转化率
gammaI=0.005;%感染者恢复率
gammaH=0.005;%隔离感染者恢复率
alpha=0.002;%致死率
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
data_Infected=[214 228 241 256 274 293 331 360 420 461 502 511 581 639 639 701 773 839 825 878 889 924 963]';
data_Cured=[22 22 32 32 32 43 43 43 46 76 76 76 101 118 118 118 118 118 144 144 144 150 191]';
plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Japan after 2010-2-27','LineWidth',5);
% title('Prediction results of Japan after 2010-2-27');