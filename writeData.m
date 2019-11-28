b1=0;
b2=0;
for u=0:4
%     for u = 0:0.01:4
    % ep 耦合系数不断变化
    b1=b1+1;
    b2=0;
    for ep=0:0.1:1
        x=rand(1,1000);
        b2=b2+1;
        ss=strcat('C:\Users\wy\Desktop\4\CML_11.07\data2\data',num2str(b1),num2str(b2),'.txt');
        csvwrite(ss,x);
    end
end