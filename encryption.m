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
Qth=chaotic_value;  
Qth = reshape(Qth(:,2),512,512);
Th=img(1:img_row/2,1:end);  % 图像的上半部分
subplot(1,3,2); imshow(Th); 
Bh=img(img_row/2+1:end,1:end); % 图像的下半部分
subplot(1,3,3); imshow(Bh);
% 需要对混沌序列进行mod 255  处理
for i = 1:img_row/2
    for j = 1: img_row
    Th(i,j)= bitxor(Th(i,j),Qth(i,j));
    Bh(N-i+1,j)=bitxor(Bh(N-i+1),Th(i,j));
    end
end
figure(2); hold on ;
subplot(121);imshow(Th);
subplot(122); imshow(Bh);
% 从左到右 置乱
% 从下左到上右 置乱
% 从上左到下右 置乱


