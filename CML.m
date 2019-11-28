clear
i =5;
 n = 50;
outputArg =zeros(6,51);
[outputArg_row,outputArg_col]=size(outputArg);
mapping_result = outputArg;
%% ¸³Öµ
mapping_result(1,1)=0.1;
mapping_result(2,1)=0.2;
mapping_result(3,1)=0.3;
mapping_result(4,1)=0.5;
mapping_result(5,1)=0.6;
% mapping_result(6,1)=mapping_result(1,1);
%%  CMLº¯ÊýÌå
for col= 1:n
    for row = 1:i
       mapping_result(outputArg_row,col)=mapping_result(1,col);
       
      % mapping_result(outputArg_row,outputArg_col+)
      %  outputArg(n*i);
      mapping_result(row,col+1)=0.3*F(mapping_result(row,col))+0.7*F(mapping_result(row+1,col));
    end
end
%%
