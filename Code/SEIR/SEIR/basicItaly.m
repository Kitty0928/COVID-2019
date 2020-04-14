%SEIRģ��
clear;clc;
%��������
%%real data
%%Italy
%confirmed
%155 229 322 453 655 888 1128 1694 2036 2502 3089 3858
%cured
%1 1 2 3 45 46 46 83 149 160 276 414
N=6043e4;%�˿���
I=155;%��Ⱦ��
R=1;%������
D=0;%������������
E=1500;%Ǳ����
S=N-I-R;%�׸�Ⱦ��
c=1.1;%�Ӵ�����������
a=1/6;%Ǳ���߻�������
B=0.0756;%��Ⱦ����
y=1/25;%��������
k=0.001;
T=5:500;
for idx =1:length(T)-1
    S(idx+1)=S(idx)-c*B*I(idx)*S(idx)/N;%�׸���������
    E(idx+1)=E(idx)+c*B*S(idx)*I(idx)/N-a*E(idx);%Ǳ������������
    I(idx+1)=I(idx)+a*E(idx)-(y+k)*I(idx);%������������
    R(idx+1)=R(idx)+y*I(idx);%������������ 
    D(idx+1)=D(idx)+k*I(idx);%����������������
end

plot(T,I,T,R,T,S,T,D,'LineWidth',5);
grid on;
xlabel('days','LineWidth',5);
ylabel('number of cases','LineWidth',5);
hold on;
data_Infected=[3 3 3 20 62 155 229 322 453 655 888 1128 1694 2036 2502 3089 3858]';
data_Cured=[0 0 0 0 1 2 1 1 3 45 46 46 83 149 160 276 414]';

plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Italy','LineWidth',5);