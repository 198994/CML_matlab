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



