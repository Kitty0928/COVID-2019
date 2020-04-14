%SEIRģ��
clear;clc;
%��ʼֵ����
%%%�ձ�2��27�ſ�ʼ�����˿�12700e4
%%��Ⱦ����
%%[214 228 241 256 274 293 331 360 420 461 502 511 581 639 639 701 773 839 825]
%%��������
%%[22 22 32 32 32 43 43 43 46 76 76 76 101 118 118 118 118 118 144]


%%%
N=12700e4;%�׸�Ⱦ��
E=120;%Ǳ����
I=214;%��ʼ��Ⱦ��Ⱥ
Sq=20;%��ʼ������׸�����
Eq=100;%��ʼ����ı�¶����
H=200;%��ʼ����ĸ�Ⱦ��Ⱥ
R=22;%��ʼ������
S=N-E-I-R;
%��������
c=2.08;%�Ӵ���
beta=1.0e-9;%��Ⱦ��
q=1.0e-5;%�Ӵ��߸�����
sigma=1/7;%1/7�Ӵ���ת��Ϊ��Ⱦ�ŵĸ���
lambda=1/16;%1/14�����ߵ��ͷŸ���
deltaI=0.4;%��֢״��Ⱦ��������Ⱦ�ߵ�ת����
deltaq=0.4;%�����Ⱦ��������Ⱦ�ߵ�ת����
gammaI=0.005;%��Ⱦ�߻ָ���
gammaH=0.005;%�����Ⱦ�߻ָ���
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
data_Infected=[214 228 241 256 274 293 331 360 420 461 502 511 581 639 639 701 773 839 825 878 889 924 963]';
data_Cured=[22 22 32 32 32 43 43 43 46 76 76 76 101 118 118 118 118 118 144 144 144 150 191]';
plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Japan after 2010-2-27','LineWidth',5);
% title('Prediction results of Japan after 2010-2-27');