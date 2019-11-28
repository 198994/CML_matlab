L =5; %% 格子数
N = 300;  %% 迭代次数;
%%  cml_3d
%% 赋值
x(1,1)=0.1;
x(1,2)=0.2;
x(1,3)=0.3;
x(1,4)=0.5;
x(1,5)=0.6;
%%   CML_3D函数体
% u 不断变化
l_u =  length(0:0.01:4);
l_ep =length(0:0.1:1) ;
X=cell(40,10);
flag_u=0;
% flag_ep = 0;
for u=0:0.01:4
    % ep 耦合系数不断变化
    flag_u=flag_u+1;
    flag_ep = 0;
    %   b2=0;
    for ep=0:0.1:1
        for i=2:N
            for j=1:L
                if(j==1)
                    x(i,j)=(1-ep)*u*x(i-1,j)*(1-x(i-1,j))+0.5*ep*u*x(i-1,j+1)*(1-x(i-1,j+1))+0.5*ep*u*x(i-1,L)*(1-x(i-1,L));
                else if(j==L)
                        x(i,j)=(1-ep)*u*x(i-1,j)*(1-x(i-1,j))+0.5*ep*u*x(i-1,1)*(1-x(i-1,1))+0.5*ep*u*x(i-1,j-1)*(1-x(i-1,j-1));
                    else
                        x(i,j)=(1-ep)*u*x(i-1,j)*(1-x(i-1,j))+0.5*ep*u*x(i-1,j+1)*(1-x(i-1,j+1))+0.5*ep*u*x(i-1,j-1)*(1-x(i-1,j-1));
                    end
                end
            end
        end
        flag_ep=flag_ep+1;
        %         b2=b2+1;
        %         ss=strcat('C:\Users\wy\Desktop\4\CML_11.06\data\CMLdata',num2str(b1),num2str(b2),'.txt');
        %         csvwrite(ss,x);
        X{flag_u,flag_ep}=x;
    end
    %     plot(u,x(100:300),'k.');
end
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
disp(J);
%  计算ep=0.2;  u 从0-4
X1=X(:,3);

for u_i =1:401
%     B{u_i}=eye(5);
    for n1=1:300
        v1=X1{u_i};
        v2=v1(n1,:);
        v=num2cell(v2);
        [x,y,z,m,n]=deal(v{:});
        A{u_i,n1}= eval (J);
    end
end
% disp(X1);
% B{1,1}=eye(5,5);
B=cell(401,300);
for u_i =1:401
    B{u_i,1}=eye(5,5);
    for n1=1:299
      B{u_i,n1+1} = A{u_i,n1+1}*B{u_i,n1};
    end
end
figure(1);
hold on;
for t=1:401    %计算最大李指数   
    vv(:,t)=eig(B{t,end});
    v=max(abs(vv));   
    LE1(t)=1/300*log(v);
   
end
u =0:0.01:4;
 plot(u,LE1,'k');

