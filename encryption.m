%  ���ܹ���   BY 198994@seu.edu.co
path = 'C:\Users\wy\Desktop\4\BOSSbase_1.01\2.pgm';
img = imread(path);
figure(1)
hold on ;
subplot(1,3,1); imshow(img); 
[img_row, img_col]=size(img);  % ����ͼƬ��С��Ϊ��������
chaotic_value = CML_last(4,0.26,5,img_row*img_col);   % get chaotic_value 
% ���ϵ��� ����  % up to down
% ����4*4����   % set up 4*4 matrix
Th=img(1:img_row/2,1:end);  % ͼ����ϰ벿��
subplot(1,3,2); imshow(Th); 
Bh=img(img_row/2+1:end,1:end); % ͼ����°벿��
subplot(1,3,3); imshow(Bh);


Qth=chaotic_value;
Qth_1=reshape(Qth(:,1),512,512);
Qth_1=mod(round(Qth_1*100),255);    % ����100����mod 255  ��Ҫ�޸� �㷨���� % ��Ҫ�Ի������н���mod 255  ����

N= 512;  % N��ͼƬ�Ĵ�С

for i = 1:N/2
    for j = 1: N
    Th(i,j)= bitxor(Th(i,j),Qth_1(i,j));
    Bh(N/2-i+1,j)=bitxor(Bh(N/2-i+1,j),Th(i,j));
    end
end
figure(2); hold on ;
subplot(121);imshow(Th);
subplot(122); imshow(Bh);
% ������������ ����
P1= uint8(zeros(N,N));  % ���ô��ϵ��µ�����ͬ�ȴ�С����
P1(1:256,1:end)=Th;  % �ϰ벿��
P1(257:end,1:end)=Bh; % �°벿��

Qrt = reshape(Qth(:,2),512,512);  %  �������
Qrt=mod(round(Qrt*100),255);

Rt = P1;
Lb = P1;
% ������������ ��ʼ����
for i = 1:N
    for j = i+1:N
    Rt(i,j) = bitxor(Rt(i,j),Qrt(i,j));
    Lb(j,i) = bitxor(Lb(j,i),Rt(i,j));
    end
end
figure(3); hold on ;
subplot(121); imshow(Rt);
subplot(122); imshow(Lb);
% ��ȡ���Ϻ����µ�Ԫ��

% �������� ����

% ���������� ����


