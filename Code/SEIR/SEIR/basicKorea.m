%SEIRģ��
clear;clc;
%��������
%%real data
%%Korea
%confirmed
%3 4 4 4 4 11 12 15 15 16 19 23 24 24 25 27 28 28 28 28 28 29 30 31 31 104 204 433 602 833 977 1261 1766 2337 3150 3736 4335 5186 5621 6088 6593 7041 7314
%cured
%0 0 0 0 0 0 0 0 0 0 0 0 1 1 3 3 3 7 7 7 9 9 10 12 12 16 16 16 18 18 22 22 22 22 27 30 30 30 41 41 135 135 118
%korea
%Italy
%Iran
%confirmed
%0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 2 5 18 28 43 61 95 139 245 388 593 978 1501 2336 2922 3513
%cured
% 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 0 49 49 73 123 175 291 291 552 739
N=5164e4;%�˿���
I=833;%��Ⱦ��
R=18;%������
D=0;%������������
E=3900;%Ǳ����
S=N-I-E-R;%�׸�Ⱦ��
r=1.15;%�Ӵ�����������
a=0.825;%Ǳ���߻�������
B=0.0525;%��Ⱦ����
y=1/32;%��������
k=0.0025;
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
data_Infected=[104 204 433 602 833 977 1261 1766 2337 3150 3736 4335 5186 5621 6088 6593 7041 7314]';
data_Cured=[16 16 16 18 18 22 22 22 22 27 30 30 30 41 41 135 135 118]';

plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of South Korea','LineWidth',5);