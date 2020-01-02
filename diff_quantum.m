%   量子置乱算法
clc; clear;
path =  'C:\Users\wy\Desktop\4\CML_11.018\1.jpg';
p4 = imread(path);
[x, y, z] = size(p4);
% q8= q8 xor q1;        q4= q4 xor q8;
% q7= q7 xnor q2;            q3= q3 xor q7;
% q6= q6 xor q3;              q2= q2 xor q6;
% q5= q5 xor q4;                 q1= q1 xor q5;
% -----------------------像素置乱---------------------------------------------------
%  将图片转换成2进制
bin_p4 = dec2bin(p4);
new_bin_p4=bin_p4;
% step 1:  高位  bit置乱
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
% step 2: 低位bit  置乱
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
%  显示图片  
% 循环移位   bitshif 会导致溢出问题
result_new_bin_p4 =  circshift(uint8(bin2dec(new_bin_p4)),4);
 result_new_bin_p4 = reshape(result_new_bin_p4,x,y,z);
disp("setp 3 转换图片!!  显示图片");
imshow(result_new_bin_p4);

% ---------------------------- -位置置乱--------------------------------------
% 得到位置信息
% 二维图片 
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



