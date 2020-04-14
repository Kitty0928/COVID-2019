%SEIR模型
clear;clc;
%初始值设置
%%%意大利3月8号开始，总人口2424e4
%%感染人数
%%[7375,  9172, 10149, 12462, 12462, 17660, 21157, 24747, 27980]
%%治愈人数
%%[622,  724,  724, 1045, 1045, 1439, 1966, 2335, 2749]


%%%
N=6043e4;%易感染者
E=12800;%潜伏者
I=7375;%初始感染人群
Sq=51200000;%初始隔离的易感人数
Eq=12800;%初始隔离的暴露人数
H=2500;%初始隔离的感染人群
R=622;%初始康复人
S=N-E-I-R;
%参数设置
c=3.82;%接触率
beta=1.98e-9;%传染率
q=0.87e-7;%接触者隔离率
sigma=1/8;%1/7接触者转化为感染着的概率
lambda=1/28;%1/14隔离者的释放概率
deltaI=0.14;%有症状感染者向隔离感染者的转化率
deltaq=0.1;%隔离感染着向隔离感染者的转化率
gammaI=0.009;%感染者恢复率
gammaH=0.009;%隔离感染者恢复率
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
data_Infected=[7375 9172 10149 12462 15113 17660 21157 24747 27980 31506 35713 41035 47021]';
data_Cured=[622 724 724 1045 1258 1439 1966 2335 2749 2941 4025 4440 4440]';
plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Italy after 2010-3-8','LineWidth',5);
% title('Prediction results of Italy after 2010-3-8');