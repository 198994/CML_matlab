%  �����ļ��ܹ���
%  ���ܹ���   BY 198994@seu.edu.co
%   ���ҹ���  ����Ҫ�Ľ�  �������� ���ӻ������۵��㷨��ͼ�����ϵͳ���������
%   ����д��
path =  'C:\Users\wy\Desktop\4\CML_11.018\1.jpg';
% path = 'C:\Users\wy\Desktop\4\BOSSbase_1.01\2.pgm';
img = imread(path);
img = img (1:512,1:512,2);   %  only read img G panel
figure(1)
hold on ;
subplot(1,3,1); imshow(img); 
[img_row, img_col]=size(img);  % ����ͼƬ��С��Ϊ��������
chaotic_value = CML_last(4,0.26,5,img_row*img_col);   % get chaotic_value 
% ���ϵ��� ��ɢ  % up to down
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
% ������������ ��ɢ
P1= uint8(zeros(N,N));  % ���ô��ϵ��µ�����ͬ�ȴ�С����
P1(1:256,1:end)=Th;  % �ϰ벿��
P1(257:end,1:end)=Bh; % �°벿��

Qrt = reshape(Qth(:,2),512,512);  %  �������
Qrt=mod(round(Qrt*100),255);
% triu and tril �����Ǿ���������Ǿ���
Rt = triu(P1);
Lb = tril(P1);
% ������������ ��ʼ��ɢ
for i = 1:N
    for j = i+1:N
    Rt(i,j) = bitxor(Rt(i,j),Qrt(i,j));
    Lb(j,i) = bitxor(Lb(j,i),Rt(i,j));
    end
end
figure(3); hold on ;
subplot(131); imshow(Rt);
subplot(132); imshow(Lb);

P2=triu(Rt)+tril(Lb,-1);
subplot(133); imshow(P2);
% ��ȡ���Ϻ����µ�Ԫ��

% �������� ��ɢ
Qrh= chaotic_value(:,3);
Qrh = reshape(Qrh,512,512);
Qrh= mod(round(Qrh*100),255);

% Lh = P2(1:end,1:N/2);
% Rh = P2(1:end,N/2+1:end);
Lh = P2;
Rh = P2;

for i = 1:N 
    for j = N/2+1:N
    Rh(i,j)=bitxor(Rh(i,j),Qrh(i,j));
    Lh(i,N-j+1) = bitxor(Lh(i,j),Rh(i,N-j+1));
    end
end
figure(4); hold on;
subplot(131);imshow(Rh);
subplot(132);imshow(Lh);
P3 = uint8(zeros(N,N));
P3(1:end,1:N/2)=Lh(1:end,1:N/2);
P3(1:end,N/2+1:end)=Rh(1:end,N/2+1:end);
subplot(133);imshow(P3);
% �����µ������۵�
Qrb = chaotic_value(:,4);
Qrb = reshape(Qrb,512,512);
Qrb = mod(round(Qrb*100),255);
P3 = rot90(P3,2);
Lt= triu(P3);
Rb= tril(P3);
for i = 1:N
    for j=N-i+2:N
    Rb(i,j)=bitxor(Rb(i,j),Qrb(i,j));
    Lt(i,j)=bitxor(Rb(j,i),Lt(i,j));
    end
end


figure(5); hold on;
subplot(131);imshow(Lt);
subplot(132);imshow(Rb);
P4 = uint8(zeros(N,N));
P4=triu(Lt)+tril(Rb,-1);
subplot(133);imshow(P4);
% ��ʼ�������ұ�д
%   ���������㷨
clc; clear;
path =  'C:\Users\wy\Desktop\4\CML_11.018\1.jpg';
p4 = imread(path);
[x, y, z] = size(p4);
% q8= q8 xor q1;        q4= q4 xor q8;
% q7= q7 xnor q2;            q3= q3 xor q7;
% q6= q6 xor q3;              q2= q2 xor q6;
% q5= q5 xor q4;                 q1= q1 xor q5;
% -----------------------��������---------------------------------------------------
%  ��ͼƬת����2����
bin_p4 = dec2bin(p4);
new_bin_p4=bin_p4;
% step 1:  ��λ  bit����
for i = 1: x
    new_bin_p4(i,3) =num2str(bitxor(str2double(new_bin_p4(i,3)),str2double(new_bin_p4(i,6))));
    new_bin_p4(i,1) =num2str(bitxor(str2double(new_bin_p4(i,1)),str2double(new_bin_p4(i,8))));
    if (bitor(str2double(new_bin_p4(i,4)),str2double(new_bin_p4(i,5)))==1)
        new_bin_p4(i,4)=num2str(0);
    else
        new_bin_p4(i,4)=num2str(1);
    end
    if (bitor(str2double(new_bin_p4(i,2)),str2double(new_bin_p4(i,7)))==1)
        new_bin_p4(i,2)=num2str(0);
    else
        new_bin_p4(i,2)=num2str(1);
    end
end
disp("setp 1 have finished!! Mbit scraming");
% step 2: ��λbit  ����
for i = 1: x
    new_bin_p4(i,7) =num2str(bitxor(str2double(new_bin_p4(i,7)),str2double(new_bin_p4(i,7))));
    new_bin_p4(i,5) =num2str(bitxor(str2double(new_bin_p4(i,5)),str2double(new_bin_p4(i,1))));
    %           bin_p4(i,7) =num2str(bitor(str2double(bin_p4(i,7)),str2double(bin_p4(i,2))));
    %           bin_p4(i,5) =num2str(bitor(str2double(bin_p4(i,5)),str2double(bin_p4(i,4))));
    if (bitor(str2double(new_bin_p4(i,8)),str2double(new_bin_p4(i,4)))==1)
        new_bin_p4(i,8)=num2str(0);
    else
        new_bin_p4(i,8)=num2str(1);
    end
    if (bitor(str2double(new_bin_p4(i,6)),str2double(new_bin_p4(i,2)))==1)
        new_bin_p4(i,6)=num2str(0);
    else
        new_bin_p4(i,6)=num2str(1);
    end
end
disp("setp 2 have finished!! L bit scraming");
%  ��ʾͼƬ  
% ѭ����λ   bitshif �ᵼ���������
result_new_bin_p4 =  circshift(uint8(bin2dec(new_bin_p4)),4);
 result_new_bin_p4 = reshape(result_new_bin_p4,x,y,z);
disp("setp 3 ת��ͼƬ!!  ��ʾͼƬ");
imshow(result_new_bin_p4);

% ---------------------------- -λ������--------------------------------------
% �õ�λ����Ϣ
% ��άͼƬ 
index = 1:16;
index = dec2bin(index,8);
for i= 1:16
    for j =1:4
   if(mod(i,2)==0)
   index(i,1)=num2str(bitxor(str2double(index(i,8)),str2double(index(i,1))));
   index(i,2)=num2str(bitxor(str2double(index(i,7)),str2double(index(i,2))));
   index(i,3)=num2str(bitxor(str2double(index(i,6)),str2double(index(i,3))));
   index(i,4)=num2str(bitxor(str2double(index(i,5)),str2double(index(i,4))));
%    else
%    index(i,5)=num2str(bitxor(str2double(index(i,1)),str2double(index(i,5))));
%    index(i,6)=num2str(bitxor(str2double(index(i,2)),str2double(index(i,6))));
%    index(i,7)=num2str(bitxor(str2double(index(i,3)),str2double(index(i,7))));
%    index(i,8)=num2str(bitxor(str2double(index(i,4)),str2double(index(i,8))));
   end
    end
end






