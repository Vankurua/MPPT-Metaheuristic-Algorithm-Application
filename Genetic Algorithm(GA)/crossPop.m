function [y1,y2] = crossPop(x1,x2)
    %���㽻��
    n = numel(x1);
    s = randi([1,n-1]); %�������λ��
    %�������
    y1 = [x1(1:s) x2(s+1:end)]; %y1 = x1(1-s)ƴ����x2��(s+1-end)
    y2 = [x2(1:s) x1(s+1:end)]; %y2 = x2(1-s)ƴ����x1��(s+1-end)
end