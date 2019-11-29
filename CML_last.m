function [outputArg1] = CML_last(u,ep,L,N)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
% L =5; %% 格子数
% N = 400;  %% 迭代次数;
% u is logistic parameter
% ep is CML parameter
%%  cml_3d
%% 初始值 initial value
x(1,1)=0.1;
x(1,2)=0.2;
x(1,3)=0.3;
x(1,4)=0.5;
x(1,5)=0.6;
%%   CML_3D函数体
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
outputArg1 = x;
end

