clear;
clc;
close all;

N = 20; %���Ӹ���
T = 30; %����������

c1 = 2; %c1 ������������ѧϰ����
c2 = 2; %c2 �������ȫ�ֵ�ѧϰ����

Wmax = 0.8; %����Ȩ�����ֵ
Wmin = 0.4; %����Ȩ����Сֵ

Xmax = 50; %λ�����ֵ
Xmin = 0; %λ����Сֵ

Vmax = 0.6*((Xmax-Xmin)/2); %�ٶ����ֵ
Vmin = -1*Vmax; %�ٶ���Сֵ
adCurve = zeros(N*T,1);
x= rand(N,1)*(Xmax-Xmin)+Xmin; %����λ����Ϣ
x_v = rand(N,1)*(Vmax-Vmin)+Vmin; %�����ٶ���Ϣ

x_Best_Position = zeros(N,1); %�����Ǹ�������ʷ���Ž�λ��
%������д��������Ӧ�ȣ�����û��Ҫ��������f(x)���ܵó�


global_Position = 0; %��¼ȫ�����Ž�λ��
global_Fitness = 0; %��¼ȫ��������Ӧ��

for i = 1:T
    for j = 1:N %ȥѭ��ÿ������
        %��������
        if(f_Multiple_Peak(x(j))>f_Multiple_Peak(x_Best_Position(j)))
            x_Best_Position(j) = x(j); %����������ʷ���Ž�
        end
        if(f_Multiple_Peak(x_Best_Position(j))>f_Multiple_Peak(global_Position))
            global_Position = x_Best_Position(j);
        end
        w = Wmax-(Wmax-Wmin)*i/T; %���㶯̬����Ȩ��
        %���¸����ӵ��ٶȺ�λ��
        x_v(j) = w*x_v(j)+c1*rand*(x_Best_Position(j)-x(j))+c2*rand*(global_Position-x(j));
        x(j) = x(j)+x_v(j);
        %���������Χ�����ø���
        if (x_v(j) > Vmax) | (x_v(j) < Vmin)
            x_v(j) = rand * (Vmax-Vmin)+Vmin;
        end
        if (x(j) > Xmax) | (x(j) < Xmin)
            x(j) = rand * (Xmax-Xmin)+Xmin;
        end
    end
end

function y = f_Multiple_Peak(x)
if x>0 & x<=14.5
    y=-power((x-10.01),2)+150;
elseif x>14.5 & x<=24.5
    y=-power((x-20.02),2)+160;
elseif x>24.5 & x<=35.8           
    y =-power((x-30.03),2)+170;
else
    y =-power((x-40.04),2)+155;
end
end
