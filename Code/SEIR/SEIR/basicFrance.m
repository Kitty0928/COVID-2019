%SEIRģ��
clear;clc;
%��������
%%real data
%%Japan
%confirmed
% 0 2 3 3 3 4 5 5 5 6 6 6 6 6 6 6 11 11 11 11 11 11 11 12 12 12 12 12 12 12 12 12 12 14 18 38 57 100 130 191 204 285 377 653 949 1126
%cured
%0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 2 2 4 4 4 4 4 4 4 4 4 4 11 11 11 11 12 12 12 12 12 12 12 12 12
N=6699e4;%�˿���
I=57;%��Ⱦ��
R=22;%������

D=0;%������������
E=4200;%Ǳ����
S=N-I-R-E;%�׸�Ⱦ��
r=1.5;%�Ӵ�����������
a=0.825;%Ǳ���߻�������
B=0.0456;%��Ⱦ����
y=1/27;%��������
k=0.001;
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
data_Infected=[12 12 14 18 38 57 100 130 191 204 285 377 653 949 1126]';
data_Cured=[4 4 11 11 11 11 12 12 12 12 12 12 12 12 12]';

plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of France','LineWidth',5);