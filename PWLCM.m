function [x] =PWLCM(p,x)
% Ã»Ð´Íê
p = 0.45;
x(1)=0.65;
for i = 1:500
    if(x(i)<p && x(i)>=0)
        x(i+1) = x(i)/p;
        if(x(i)<=0.5 && x(i)>=p)
            x(i+1) = (x(i)-p)/(0.5-p);
        else
            x(i+1) = PWLCM(p,1-x(i));
        end
    end
end
end