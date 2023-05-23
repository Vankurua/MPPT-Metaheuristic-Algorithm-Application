function dec = gray2dec(gray)
    bin = zeros(size(gray)); % ��ʼ������������
    bin(1) = gray(1); % �����������ĵ�һλ���ڸ�����ĵ�һλ
    for ii = 2:length(gray)
        bin(ii) = xor(bin(ii-1),gray(ii)); % ���ݸ�����Ķ���������������
    end
    dec = bin2dec(num2str(bin)); % ������������ת��Ϊʮ������
end


