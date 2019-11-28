%% Logistc's Lypunov exponent
% n=10000;
% a=0:0.001:4;   %����ȡ��0.001����ԭ��ĸ���ϸ
% len=length(a);
% a=reshape(a,len,1);
% sum=zeros(len,1);
% unit=ones(len,1);
% x=unit*0.1;
%
% for i=1:n
%     y=a.*(unit-2*x);
%     sum=sum+log(abs(y));
%     x=a.*x.*(unit-x);
% end
% lamuda=sum/1000;
% plot(a,lamuda)
% grid on
%
% xlabel('\fontsize{16}a')
% ylabel('\fontsize{16}Lyapunov\fontname{����}ָ��\lambda')
%%  Logistic map
clear  all;
clc 
axis([0,4,0,1]);
u = 0:0.01:4;
len = length(u);
% ѭ��1000��
x = zeros(len,1000);
for i = 1:len
    x(i,1)=0.23;
    for n = 2:1000
        x(i,n)=u(i)*x(i,n-1)*(1-x(i,n-1));
    end
end
% ����   Lypunov exponent
sum= zeros(len,1000);
for i = 1:len
    for n = 2:1000
        dy(i,n)= u(i)-2*u(i)*x(i,n);
        sum(i,n)=sum(i,n-1)+log(abs(dy(i,n)));
    end
end
LE = sum(:,1000);
LE1=LE./1000;
grid on;
plot(u(2:end),LE1(2:end));
% plot(u(2:end,[0,1])


















