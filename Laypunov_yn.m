clear all;
clc;
a=0.9:0.001:1.4;
k=length(a);
b=0.3;
p=600;
for n=1:k      
    for m=2:p       
        x(1,n)=0.4;
        y(1,n)=0.6; 
        x(m,n)=1+b*y(m-1,n)-a(n)*x(m-1,n)^2;  
        y(m,n)=x(m-1,n);   
    end
end
for r=1:k    %计算雅克比矩阵    
    for h=2:p          
        A{1,r}=[-2*a(r)*x(1,r),b;1,0];   
        A{h,r}=[-2*a(r)*x(h,r),b;1,0]*A{h-1,r};   %注意元胞数组相乘顺序    
    end
end

for t=1:k    %计算最大李指数   
    vv(:,t)=eig(A{p,t});
    v=max(abs(vv));   
    LE1=1/p*log(v);
end
plot(a,LE1,'k');
hold on;
plot(a,0,'k:');
axis([a(1),a(k),-1 1]);
xlabel('a');ylabel('LE1');title('最大李指数');