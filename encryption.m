%  加密过程   BY 198994@seu.edu.co
%   混乱过程  尚需要改进  方法来自 量子混沌与折叠算法的图像加密系统———金聪
%   北邮写的
path =  'C:\Users\wy\Desktop\4\CML_11.018\1.jpg';

% path = 'C:\Users\wy\Desktop\4\BOSSbase_1.01\2.pgm';
img = imread(path);
img = img (1:512,1:512,2);   %  only read img G panel
figure(1)
hold on ;
subplot(1,3,1); imshow(img); 
[img_row, img_col]=size(img);  % 测量图片大小，为衡量次数
chaotic_value = CML_last(4,0.26,5,img_row*img_col);   % get chaotic_value 
% 从上到下 扩散  % up to down
% 设置4*4矩阵   % set up 4*4 matrix
Th=img(1:img_row/2,1:end);  % 图像的上半部分
subplot(1,3,2); imshow(Th); 
Bh=img(img_row/2+1:end,1:end); % 图像的下半部分
subplot(1,3,3); imshow(Bh);


Qth=chaotic_value;
Qth_1=reshape(Qth(:,1),512,512);
Qth_1=mod(round(Qth_1*100),255);    % 扩大100倍，mod 255  需要修改 算法核心 % 需要对混沌序列进行mod 255  处理

N= 512;  % N是图片的大小

for i = 1:N/2
    for j = 1: N
    Th(i,j)= bitxor(Th(i,j),Qth_1(i,j));
    Bh(N/2-i+1,j)=bitxor(Bh(N/2-i+1,j),Th(i,j));
    end
end
figure(2); hold on ;
subplot(121);imshow(Th);
subplot(122); imshow(Bh);
% 从右上往左下 扩散
P1= uint8(zeros(N,N));  % 设置从上到下的密文同等大小矩阵
P1(1:256,1:end)=Th;  % 上半部分
P1(257:end,1:end)=Bh; % 下半部分

Qrt = reshape(Qth(:,2),512,512);  %  混沌矩阵
Qrt=mod(round(Qrt*100),255);
% triu and tril 上三角矩阵和下三角矩阵
Rt = triu(P1);
Lb = tril(P1);
% 从右上往左下 开始扩散
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
% 提取右上和左下的元素

% 从右往左 扩散
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
% 从右下到左上折叠
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
% 开始进行置乱编写



