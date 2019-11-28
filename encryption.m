% a = rand(6,6);
% b = rand(6,6);
img = imread('1.jpg');
img_R = img(:,:,1);
img_G = img(:,:,2);
img_B = img(:,:,3);
[row ,col] = size(img_R);  % get img size row and col


% img1 =img(1:3,1:3,1);
% img2 =img(4:6,4:6,1);
% [m n] = size(img1);
% img1 = dec2bin(img1);
% img2 = dec2bin(img2);
% c = bitxor(img1,img2);
% disp(c);
% 从上到下 置乱  % up to down
% 设置4*4矩阵   % set up 4*4 matrix
blkproc
for m = 1: row 
    for n =1: col 
        upMatrix=;
        downMatix= ;
    end
end 

result = bitxor(upMatrix,downMatrix);
% 从左到右 置乱
% 从下左到上右 置乱
% 从上左到下右 置乱
new = bitxor(img1,c)
img3 = bitxor(new,c)

