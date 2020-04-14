%SEIRģ��
clear;clc;
%��ʼֵ����
%%%�����3��8�ſ�ʼ�����˿�2424e4
%%��Ⱦ����
%%[7375,  9172, 10149, 12462, 12462, 17660, 21157, 24747, 27980]
%%��������
%%[622,  724,  724, 1045, 1045, 1439, 1966, 2335, 2749]


%%%
N=4672e4;%�˿���
E=12800;%Ǳ����
I=9942;%��ʼ��Ⱦ��Ⱥ
Sq=11200000;%��ʼ������׸�����
Eq=12800;%��ʼ����ı�¶����
H=500;%��ʼ����ĸ�Ⱦ��Ⱥ
R=530;%��ʼ������
S=N-E-I-R;
%��������
c=5;%�Ӵ���
beta=4.45e-9;%��Ⱦ��
q=1.45e-7;%�Ӵ��߸�����
sigma=1/8;%1/7�Ӵ���ת��Ϊ��Ⱦ�ŵĸ���
lambda=1/28;%1/14�����ߵ��ͷŸ���
deltaI=0.14;%��֢״��Ⱦ��������Ⱦ�ߵ�ת����
deltaq=0.1;%�����Ⱦ��������Ⱦ�ߵ�ת����
gammaI=0.009;%��Ⱦ�߻ָ���
gammaH=0.009;%�����Ⱦ�߻ָ���
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
data_Infected=[9942	11748 13910 17963 20410]';
data_Cured=[530 1028 1081 1107 1588]';
plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of Spain after 2010-3-16','LineWidth',5);
% title('Prediction results of Spain after 2010-3-16');