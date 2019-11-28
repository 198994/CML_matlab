
y=[0:1,0.1];
x=[0:1,0.1];
y=4*x+4.*x.*x;
plot(x,y)

% syms x z
% y=x^2+z^2
% a=jacobian(y,[x,z])  %计算雅可比矩阵.
% x=1;z=1;b=eval(a);    % 求导之后的计算
% syms r l f
% x=r*cos(l)*cos(f);
% y=r*cos(l)*sin(f);
% z=r*sin(l);
% J=jacobian([x;y;z],[r l f])
mapping_result(1,1)=0.1;
mapping_result(2,1)=0.2;
mapping_result(3,1)=0.3;
mapping_result(4,1)=0.5;
mapping_result(5,1)=0.6;
CML_3D_Function(5,1000,mapping_result);

clear
syms x y z 
f=2*x^2+3*y^3+4*z;
result = jacobian(f,[x,y,z]);
a=[0,0.1,5,7];
b=[0,0.11,2,8];
c=[0,0.1,2,5];
for i=1:4
    x=a(i);
     y=b(i);
      z=c(i);
    result1 = eval(result);
end


temp=1;
for i=2:5
    
    temp = temp*i;
end
%雅可比矩阵
syms x(i) x(i+1)
f=x(i)+2*x(i+1)^2;
jacobian(f,[x(i),x(i+1)]);
%雅可比矩阵
syms x(i) 
f=x(i)+2*x(i)^2;
Jacobian(f,[x(i)]);














