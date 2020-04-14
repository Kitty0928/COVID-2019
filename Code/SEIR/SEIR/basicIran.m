%SEIRģ��
clear;clc;
%��������
%%real data
%%Japan
%confirmed
%0 2 5 18 28 43 61 95 139 245 388 593 978 1501 2336 2922 3513
%cured
%0 0 0 0 0 0 0 0 49 49 73 123 175 291 291 552 739
N=8180e4;%�˿���
I=95;%��Ⱦ��
R=49;%������
D=0;%������������
E=1500;%Ǳ����
S=N-I-R;%�׸�Ⱦ��
r=1.1;%�Ӵ�����������
a=1/6;%Ǳ���߻�������
B=0.106;%��Ⱦ����
y=1/20;%��������
k=0.005;
T=6:500;
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
data_Infected=[0 2 5 18 28 43 61 95 139 245 388 593 978 1501 2336 2922 3513]';
data_Cured=[0 0 0 0 0 0 0 0 49 49 73 123 175 291 291 552 739]';

plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Iran','LineWidth',5);