function p = selectPop(Parent) 
    %������ѡ��
    n = numel(Parent); 
    index = randperm(n); %index������1-30 �����ǲ��ظ�������,��ʵ���൱��������1-30���������
    p1 = Parent(index(1)); %ֻѡ�����е�����������бȽ�
    p2 = Parent(index(2));
    if p1.y >= p2.y %ѡ����Ӧ�Ƚϴ���Ǹ�
        p=p1;
    else
        p=p2;
    end
        
end