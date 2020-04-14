%SEIRģ��
clear;clc;
%��������
%%real data
%%US
%confirmed
% 1 2 2 5 5 5 5 5 7 8 8 11 11 12 12 12 12 12 12 13 13 15 15 15 15 15 15 15 15 35 35 35 53 53 59 60 62 70 76 101 121 152 220 277 416 538
%cured
%0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 3, 3, 3, 3, 3 3 3 3 3 3 3 3 5 5 5 5 6 6 6 7 7 7 7 8 8 8 8 8 8
N=32700e4;%�˿���
I=35;%��Ⱦ��
R=5;%������
D=0;%������������
E=92;%Ǳ����
S=N-I-R-E;%�׸�Ⱦ��
r=1.38;%�Ӵ�����������
a=0.556;%Ǳ���߻�������
B=0.0667;%��Ⱦ����
y=1/26.1;%��������
k=0.002;
T=5:500;

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
data_Infected=[35 53 53 59 60 62 70 76 101 121 152 220 277 416 538]';
data_Cured=[5 5 6 6 6 7 7 7 7 8 8 8 8 8 8]';

plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of US','LineWidth',5);