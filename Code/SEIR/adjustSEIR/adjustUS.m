%SEIRģ��
clear;clc;
%��ʼֵ����
%%%����3��16�ſ�ʼ�����˿�33100e4
%%��Ⱦ����
%%[6633	7652]
%%��������
%%[12	12]


%%%
N=33100e4;%�˿���
E=7800;%Ǳ����
I=2179;%��ʼ��Ⱦ��Ⱥ
Sq=12002000;%��ʼ������׸�����
Eq=12800;%��ʼ����ı�¶����
H=2600;%��ʼ����ĸ�Ⱦ��Ⱥ
R=12;%��ʼ������
S=N-E-I-R;
%��������
c=1.28%�Ӵ���
beta=1.88e-9;%��Ⱦ��
q=1.18e-6;%�Ӵ��߸�����
sigma=1/7;%1/7�Ӵ���ת��Ϊ��Ⱦ�ŵĸ���
lambda=1/28;%1/14�����ߵ��ͷŸ���
deltaI=0.05;%��֢״��Ⱦ��������Ⱦ�ߵ�ת����
deltaq=0.12;%�����Ⱦ��������Ⱦ�ߵ�ת����
gammaI=0.001;%��Ⱦ�߻ָ���
gammaH=0.001;%�����Ⱦ�߻ָ���
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
data_Infected=[2179 2727 3499 4632	6421 7783 13677 19100 ]';
data_Cured=[12 12 12 17 17 89 106 147]';
plot([1:length(data_Infected)]'-1,[data_Infected data_Cured],'*','LineWidth',5);
set(gca,'FontSize',25);
set(gca,'FontName','Times New Roman');
legend('Infected','Recovered','Reported data of infected', 'Reported data of recovered');
title('Prediction results of US after 2010-3-13','LineWidth',5);
% title('Prediction results of US after 2010-3-13');