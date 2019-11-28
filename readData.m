b1=0;
b2=0;
x= cell(1,1);
for u=0:4
b1=b1+1;
    b2=0;
    for  ep=0:0.1:1
        b2=b2+1;
        ss=strcat('C:\Users\wy\Desktop\4\CML_11.07\data2\data',num2str(b1),num2str(b2),'.txt');
       x{b1,b2}= csvread(ss);
    end
end
