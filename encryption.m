%  加密过程   BY 198994@seu.edu.co
path = 'C:\Users\wy\Desktop\4\BOSSbase_1.01\2.pgm';
img = imread(path);
figure(1)
hold on ;
subplot(1,3,1); imshow(img); 
[img_row, img_col]=size(img);  % 测量图片大小，为衡量次数
chaotic_value = CML_last(4,0.26,5,img_row*img_col);   % get chaotic_value 
% 从上到下 置乱  % up to down
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
% 从右上往左下 置乱
P1= uint8(zeros(N,N));  % 设置从上到下的密文同等大小矩阵
P1(1:256,1:end)=Th;  % 上半部分
P1(257:end,1:end)=Bh; % 下半部分

Qrt = reshape(Qth(:,2),512,512);  %  混沌矩阵
Qrt=mod(round(Qrt*100),255);

Rt = P1;
Lb = P1;
% 从右上往左下 开始置乱
for i = 1:N
    for j = i+1:N
    Rt(i,j) = bitxor(Rt(i,j),Qrt(i,j));
    Lb(j,i) = bitxor(Lb(j,i),Rt(i,j));
    end
end
figure(3); hold on ;
subplot(121); imshow(Rt);
subplot(122); imshow(Lb);
% 提取右上和左下的元素

% 从右往左 置乱

% 从上左到下右 置乱


