function gray = dec2gray(dec)
bin = de2bi(dec, 'left-msb'); % ��ʮ������ת��Ϊ���������������Ϊ���λ
n = length(bin); % ��������������
gray = zeros(1, n); % ��ʼ������������
gray(1) = bin(1); % �����������ĵ�һλ�������������ͬ
for ii = 2:n
    gray(ii) = xor(bin(ii-1), bin(ii)); % ���ݶ����������Ķ���������������
end
end
