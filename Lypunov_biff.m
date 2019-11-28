%Lyapunov 分叉图
%     画图的时候需要知道plot函数，这个 MATLAB 函数 创建 Y 中数据对 X 中对应值的二维线图。 如果 X 和 Y 都是向量，则它们的长度必须相同。plot 函数绘制 Y 对 X 的图。
%     如果 X 和 Y 均为矩阵，则它们的大小必须相同。plot 函数绘制 Y 的列对 X 的列的图。 如果 X 或 Y
%     中的一个是向量而另一个是矩阵，则矩阵的各维中必须有一维与向量的长度相等。如果矩阵的行数等于向量长度，则 plot
%     函数绘制矩阵中的每一列对向量的图。如果矩阵的列数等于向量长度，则该函数绘制矩阵中的每一行对向量的图。
%     *************************最重要**********************************************************
%     如果矩阵为方阵，则该函数绘制每一列对向量的图。 如果 X 或
%     Y 之一为标量，而另一个为标量或向量，则 plot 函数会绘制离散点。但是，要查看这些点，您必须指定标记符号，例如 plot(X,Y,'o')。
% plot 第一种方式 u是向量 x也是向量
% figure;
% hold on
% 
% u=0:0.01:4;
% axis([0,4,0,1]);
% len = length(u);
%  x(1)=0.23;
% for i = 1:len
%     for n = 1:1000
%         x(n+1)=u(i)*x(n)*(1-x(n));
%     end 
%     for n=200:500
%     plot(u(i),x(n),'k.');
%     end
% end
% plot 第一种方式 u是向量 x是方阵
figure;
hold on;
u=0:0.01:4;
axis([0,4,0,1]);
len = length(u);

for i =1:len
    x(i,1)=0.23;
for n =2:1000   
    x(i,n)=u(i)*x(i,n-1)*(1-x(i,n-1));
end
% 画图
for m=200:300
    plot(u(i),x(i,m),'k.')
end
end
%  for n=200:500
%     plot(4,x(n),'k.');
%     end
% figure;
% axis([0,4,0,1]);
% grid
% hold on
% for r = 0:0.005:3.9;
% x = 0.1;
% for i =2:200
% x(i) = r *x(i-1) *(1-x(i-1));
% end
% % pause(0.1)
% for i=151:200
% plot(r,x(i),'k.');
% end
% end
% figure 
% axis([0,4,0,1])
% hold on
% x = 0:0.01:1;
% y =rand(1,1000);
% for n =1:length(x)
% for i =500:1000
% plot(x(n),y(i),'k.');
% end
% end
