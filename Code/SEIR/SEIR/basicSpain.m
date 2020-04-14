%SEIRģ��
clear;clc;
%��������
%%real data
%%Span
%confirmed
%0 0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 2 6 13 15 32 45 84 120 165 222 259 400 500 673
%cured
%0 0 0 0 0 0 0 0 0,  0,  0,  0,  0,  0,  0,  0,  0,
 %       0,  0,  0,  0,  0,  0,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,  2,
  %      2,  2,  2,  2,  2,  2,  2 2 2 2 30 30
N=4672e4;%�˿���
I=32;%��Ⱦ��
R=2;%������
D=0;%������������
E=9;%Ǳ����
S=N-I-R-E;%�׸�Ⱦ��
r=0.97;%�Ӵ�����������
a=0.865;%Ǳ���߻�������
B=0.0836;%��Ⱦ����
y=1/25;%��������
k=0.003;
T=0:500;
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
data_Infected=[15 32 45 84 120 165 222 259 400 500 673]';
data_Cured=[2 2 2 2 2 2 2 2 2 30 30]';

plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Spain','LineWidth',5);