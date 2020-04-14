%SEIRģ��
clear;clc;
%��������
%%real data
%%Japan
%confirmed
%1 2 2 4 4 7 7 11 15 20 20 20 22 22 25 25 26 26 26 28 28 29 43 45 59 66 74 84 94 105 122 147 159 170 189 214 228 241 256 274 293 331 360 420 461 502
%cured
%0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 9 9 9 9 12 12 12 13 18 18 22 22 22 22 22 22 22 22 32 32 32 43 43 43 46 76 76
N=12700e4;%�˿���
I=189;%��Ⱦ��
R=22;%������
D=0;%������������
E=105;%Ǳ����
S=N-I-R-E;%�׸�Ⱦ��
r=0.90;%�Ӵ�����������
a=0.652;%Ǳ���߻�������
B=0.0644;%��Ⱦ����
y=1/27;%��������
k=0.001;
T=6:800;                
for idx =1:length(T)-1
    S(idx+1)=S(idx)-r*B*I(idx)*S(idx)/N;%�׸���������
    E(idx+1)=E(idx)+r*B*S(idx)*I(idx)/N-a*E(idx);%Ǳ������������
    I(idx+1)=I(idx)+a*E(idx)-(y+k)*I(idx);%������������
    R(idx+1)=R(idx)+y*I(idx);%������������ 
    D(idx+1)=D(idx)+k*I(idx);%��������������
end

plot(T,I,T,R,T,S,T,D,'LineWidth',5);
grid on;
xlabel('days','LineWidth',5);
ylabel('number of cases','LineWidth',5);
hold on;
data_Infected=[105 122 147 159 170 189 214 228 241 256 274 293 331 360 420 461 502]';
data_Cured=[22 22 22 22 22 22 22 22 32 32 32 43 43 43 46 76 76]';

plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Japan','LineWidth',5);