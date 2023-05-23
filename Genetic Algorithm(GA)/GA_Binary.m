clc;
clear;

N = 20; %��Ⱥ��СΪ30 | group size
I = 11; %Ⱦɫ�峤�� | size of string

T = 100; %����������Ϊ100; | maximum Iteration times
PC = 0.8; %������� | cross possibilities
PM = 0.1;% ������� | mutate possibilities

nC = round(N * PC/2)*2; %��Ҫ��֤��һ��Ҳ��ż�� | the next generation of the iteration must be even so round.

Observe = ones(N,100); %����ÿ�α������Ϣ

template.x = []; %template.x���������, �������Ʊ���
template.y = []; %template.y��������ͣ����ø������Ӧ��

Parent = repmat(template,N,1); %����������Parent(i).x��ʾλ�ã�Parent(i).y��ʾ��Ӧ��

%��ʼ����Ⱥ
for i = 1:N
    Parent(i).x = randi([0,1],1,I); %�Ը������г�ʼ��
    Parent(i).y = f(bin2dec(num2str(Parent(i).x))/100); %��Parent��ֵ��Ӧ��
end

for t = 1:T
    Offspring = repmat(template,nC/2,2); %�Ӵ� ������2�е���ʽ�����㽻��
    
    for j = 1:nC/2
        p1 = selectPop(Parent);
        p2 = selectPop(Parent);
        [Offspring(j,1).x, Offspring(j,2).x] = crossPop(p1.x,p2.x); %����
    end
    Offspring = Offspring(:);
    
    %����
    for k=1:nC
        Offspring(k).x = mutatePop(Offspring(k).x, PM);
        Offspring(k).y = f(bin2dec(num2str(Offspring(k).x))/100); %������Ӧ��ֵ
    end
    
    newPop = [Parent; Offspring]; %��������
    [~,so]=sort([newPop.y],'descend');%�Ӵ�С���� ������Ӧ��
    newPop = newPop(so); %����
    Parent = newPop(1:N); %������ѡ�񷨣�ѡ��ԭ����Ⱥ�ĸ���
    
    temp = zeros(N,1);
    for z=1:N
        temp(z) = bin2dec(num2str(Parent(z).x))/100;
    end
    Observe(:,t) = temp;
    
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
function y = f(x)
    y = -power((x-10.32),2)+100.0002;
end
