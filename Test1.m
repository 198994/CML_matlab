%%  CML map Lyapunov exponent
%  构建CML map
L= 5;         % 格子数
% ep = 0:0.1:1;
% len_ep = length(ep);  % CML Map 参数ep
% u = 0:0.01:4;
% len_u = length(u);    % Logistic Map 参数 u
N=1000;
b1=0;
b2=0;
% x(1,1)=0.1;
% x(1,2)=0.2;
% x(1,3)=0.3;
% x(1,4)=0.5;
% x(1,5)=0.6;
% % ep= 0.2;
% % u =4;
% for u=0:0.1:4
%     % ep 耦合系数不断变化
%     b1=b1+1;
%     b2=0;
%     for ep=0:0.1:1
%         for i=2:N
%             for j=1:L
%                 if(j==1)
%                     x(i,j)=(1-ep)*u*x(i-1,j)*(1-x(i-1,j))+0.5*ep*u*x(i-1,j+1)*(1-x(i-1,j+1))+0.5*ep*u*x(i-1,L)*(1-x(i-1,L));
%                 else if(j==L)
%                         x(i,j)=(1-ep)*u*x(i-1,j)*(1-x(i-1,j))+0.5*ep*u*x(i-1,1)*(1-x(i-1,1))+0.5*ep*u*x(i-1,j-1)*(1-x(i-1,j-1));
%                     else
%                         x(i,j)=(1-ep)*u*x(i-1,j)*(1-x(i-1,j))+0.5*ep*u*x(i-1,j+1)*(1-x(i-1,j+1))+0.5*ep*u*x(i-1,j-1)*(1-x(i-1,j-1));
%                     end
%                 end
%             end
%         end
%         b2=b2+1;
%         ss=strcat('C:\Users\wy\Desktop\4\CML_11.07\data\CMLdata',num2str(b1),num2str(b2),'.txt');
%         csvwrite(ss,x);
%     end
% end
%% 求导 对于5个格子
syms p x y z m n q
%    0 1 2 3 4 5 6
% f1=(1-0.5)*4*x*(1-x)+1/2*0.5*(4*y*(1-y)+4*p*(1-p));
f1=(1-0.5)*4*x*(1-x)+1/2*0.5*(4*y*(1-y)+0);
f2=(1-0.5)*4*y*(1-y)+1/2*0.5*(4*z*(1-z)+4*x*(1-x));
f3=(1-0.5)*4*z*(1-z)+1/2*0.5*(4*m*(1-m)+4*y*(1-y));
f4=(1-0.5)*4*m*(1-m)+1/2*0.5*(4*n*(1-n)+4*z*(1-z));
% %f5=(1-0.5)*4*n*(1-n)+1/2*0.5*(4*q*(1-q)+4*m*(1-m));
f5=(1-0.5)*4*n*(1-n)+1/2*0.5*(0+4*m*(1-m));
J = jacobian([f1,f2,f3,f4,f5],[x,y,z,m,n]);
%%  读取文件
b1=0;
b2=0;
a= cell(1,1);
for u=0:0.1:4
    b1=b1+1;
    b2=0;
    for  ep=0:0.1:1
        b2=b2+1;
        ss=strcat('C:\Users\wy\Desktop\4\CML_11.07\data\CMLdata',num2str(b1),num2str(b2),'.txt');
        a{b1,b2}= csvread(ss);
    end
end

%% 计算雅可比矩阵
for i = 1:1000
    for i1 = 1:41
        for j = 1:11
            test=a{i1,j};
            x=test(i,1);
            y=test(i,2);
            z=test(i,3);
            m=test(i,4);
            n=test(i,5);
            for j1 = 1:41
                LE{j1,1}=eye(5);
                LE{j1,i+1} = eval(J);
                %    LE{i+1} = eval(J);
                LE{j1,i+2}=LE{j1,i}*LE{j1,i+1};
            end
        end
    end
    %  test=a{1,1};
    % LE=cell(1,1);
    
%     x=test(i,1);
%     y=test(i,2);
%     z=test(i,3);
%     m=test(i,4);
%     n=test(i,5);
%     
%     %     错了
%     for j1 = 1:41
%         LE{j1,1}=eye(5);
%         LE{j1,i+1} = eval(J);
%         %    LE{i+1} = eval(J);
%         LE{j1,i+2}=LE{j1,i}*LE{j1,i+1};
%     end
    %     %     LE{i+2}=LE{i}*LE{i+1};
end
LE1= LE(:,923);
for i = 1:41
    vv= eig(LE1{i});
    v=max(abs(vv));
    LE2(i)=(1/1000)*log(v);
end
u=0:0.1:4;
plot(u,LE2,'k');


