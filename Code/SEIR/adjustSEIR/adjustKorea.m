%SEIRģ��
clear;clc;
%��ʼֵ����
%%%�����3��8�ſ�ʼ�����˿�2424e4
%%��Ⱦ����
%%[602 833 977 1261 1766 2337 3150 3736 4335 5186 5621 6088 6593 7041 7314 7478 7513 7755 7869 7979 8086 8162 8236]
%%��������
%%[18 18 22 22 22 22 27 30 30 30 41 41 135 135 118 118 247 288 333 510 510 510 1137]


%%%
N=5164e4;%�׸�Ⱦ��
E=3990;%Ǳ����
I=1766;%��ʼ��Ⱦ��Ⱥ
Sq=40000000;%��ʼ������׸�����
Eq=2990;%��ʼ����ı�¶����
H=602;%��ʼ����ĸ�Ⱦ��Ⱥ
R=22;%��ʼ������
S=N-E-I-R;
%��������
c=1.45;%�Ӵ���
beta=1.86e-9;%��Ⱦ��
q=3.52e-6;%�Ӵ��߸�����
sigma=1/8;%1/7�Ӵ���ת��Ϊ��Ⱦ�ŵĸ���
lambda=1/28;%1/14�����ߵ��ͷŸ���
deltaI=0.14;%��Ⱦ��������Ⱦ�ߵ�ת����
deltaq=0.13;%�����Ⱦ��������Ⱦ�ߵ�ת����
gammaI=0.005;%��Ⱦ�߻ָ���
gammaH=0.002;%�����Ⱦ�߻ָ���
alpha=0.002;%������
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