L =5; %% 格子数
N = 400;  %% 迭代次数;
%%  cml_3d
%% 赋值
x(1,1)=0.1;
x(1,2)=0.2;
x(1,3)=0.3;
x(1,4)=0.5;
x(1,5)=0.6;
%%   CML_3D函数体
% u 不断变化
%     b1=0;
%     b2=0;
A=figure(1);
hold on ;
for u=0:0.01:4
    % ep 耦合系数不断变化
%     b1=b1+1;
%     b2=0;
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
%         b2=b2+1;
%         ss=strcat('C:\Users\wy\Desktop\4\CML_11.06\data\CMLdata',num2str(b1),num2str(b2),'.txt');
%         csvwrite(ss,x);
    end
    plot(u,x(100:300),'k.');
end
% imwrite(A,'C:\Users\wy\Desktop\4\CML_11.013\cml.png','png')


