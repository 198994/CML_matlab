clear 
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
ep = 0:0.1:1;
u =0:0.01:4;

result1{1,1}=eye(5);
% result=zeros(1000,1000);
for i= 1: 1000
         a=diffValue(:,i);
    x=a(1); y=a(2); z=a(3); m=a(4); n=a(5);
     result{1,i}= eval(J);
  result1{1,i+1}=result1{1,i}*result{1,i};
end
%% 计算李雅普诺夫指数
% [v,g]=eig(result1);
% [m,n]= size(result1);
% 
% for i = 1:m*n
%     syms n
%    LE(i)= limit(log(abs(g(i)))*(1/n),n,inf);
% end

