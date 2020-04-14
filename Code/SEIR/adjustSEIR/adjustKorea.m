%SEIR模型
clear;clc;
%初始值设置
%%%意大利3月8号开始，总人口2424e4
%%感染人数
%%[602 833 977 1261 1766 2337 3150 3736 4335 5186 5621 6088 6593 7041 7314 7478 7513 7755 7869 7979 8086 8162 8236]
%%治愈人数
%%[18 18 22 22 22 22 27 30 30 30 41 41 135 135 118 118 247 288 333 510 510 510 1137]


%%%
N=5164e4;%易感染者
E=3990;%潜伏者
I=1766;%初始感染人群
Sq=40000000;%初始隔离的易感人数
Eq=2990;%初始隔离的暴露人数
H=602;%初始隔离的感染人群
R=22;%初始康复人
S=N-E-I-R;
%参数设置
c=1.45;%接触率
beta=1.86e-9;%传染率
q=3.52e-6;%接触者隔离率
sigma=1/8;%1/7接触者转化为感染着的概率
lambda=1/28;%1/14隔离者的释放概率
deltaI=0.14;%感染者向隔离感染者的转化率
deltaq=0.13;%隔离感染着向隔离感染者的转化率
gammaI=0.005;%感染者恢复率
gammaH=0.002;%隔离感染者恢复率
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
data_Infected=[1766 2337 3150 3736 4335 5186 5621 6088 6593 7041 7314 7478 7513 7755 7869 7979 8086 8162 8236 8320 8413 8565 8652]';
data_Cured=[22 22 27 30 30 30 41 41 135 135 118 118 247 288 333 510 510 510 1137 1407 1540 1540 1540]';
plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of South Korea after 2010-2-27','LineWidth',5);
% title('Prediction results of South Korea after 2010-2-27');