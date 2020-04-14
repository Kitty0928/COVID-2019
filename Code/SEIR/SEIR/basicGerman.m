%SEIRģ��
clear;clc;
%��������
%%real data
%%Germany
%confirmed
% 0 0 0 0 1 4 4 4 5 8 10 12 12 12 12 13 13 14 14 16 16 16 16 16 16 16 16  16 16 16 16 16 16 17 27 46 48 79 130 159 196 262 482 670 799 1040
%cured
%0 0 0 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 4 9 9 9 9 12 12 12 13 18 18 22 22 22 22 22 22 22 22 32 32 32 43 43 43
N=8293e4;%�˿���
I=79;%��Ⱦ��
R=22;%������
D=5;%������������
E=400;%Ǳ����
S=N-I-R-E;%�׸�Ⱦ��
r=1.1;%�Ӵ�����������
a=0.958;%Ǳ���߻�������
B=0.075;%��Ⱦ����
y=1/30;%��������
k=0.001;
T=3:500;
for idx =1:length(T)-1
    S(idx+1)=S(idx)-r*B*I(idx)*S(idx)/N;%�׸���������
    E(idx+1)=E(idx)+r*B*S(idx)*I(idx)/N-a*E(idx);%Ǳ������������
    I(idx+1)=I(idx)+a*E(idx)-(y+k)*I(idx);%������������
    R(idx+1)=R(idx)+y*I(idx);%������������ 
    D(idx+1)=D(idx)+k*I(idx);%����������������
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