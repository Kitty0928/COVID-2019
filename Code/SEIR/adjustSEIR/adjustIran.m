%SEIRģ��
clear;clc;
%��ʼֵ����
%%%�����2��27�ſ�ʼ�����˿�2424e4
%%��Ⱦ����
%%[139 245 388 593 978 1501 2336 2922 3513 4747 5823 6566  7161 8042 9000 10075 11364 12729 13938 14991]
%%��������
%%[49 49 73 123 175 291 291 552 739 913 1669 2134 2394 2731 2959 2959 2959 2959 4590 4590]

%%%
N=8043e4;%�׸�Ⱦ��
E=8042-6565;%Ǳ����
I=6565;%��ʼ��Ⱦ��Ⱥ
Sq=520000;%��ʼ������׸�����
Eq=400;%��ʼ����ı�¶����
H=500;%��ʼ����ĸ�Ⱦ��Ⱥ
R=2134;%��ʼ������
S=N-E-I-R;
%��������
c=3.8;%�Ӵ���
beta=0.95e-9;%��Ⱦ��
q=9.05e-7;%�Ӵ��߸�����
sigma=1/7;%1/7�Ӵ���ת��Ϊ��Ⱦ�ŵĸ���
lambda=1/28;%1/14�����ߵ��ͷŸ���
deltaI=0.04;%��֢״��Ⱦ��������Ⱦ�ߵ�ת����
deltaq=0.12;%�����Ⱦ��������Ⱦ�ߵ�ת����
gammaI=0.055;%��Ⱦ�߻ָ���
gammaH=0.02;%�����Ⱦ�߻ָ���
alpha=0.02;%������
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
data_Infected=[6565 7161 8042 9000 10075 11364 12729 13938 14991  16169 17361 18407]';
data_Cured=[2134 2394 2731 2959 2959 2959 2959 4590 4590 5389 5389 5710]';
plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Iran after 2010-3-8','LineWidth',5);
% title('Prediction results of Iran after 2010-3-8');