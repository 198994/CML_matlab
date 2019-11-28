clear
i =10; %% 格子数
n = 100;  %% 迭代次数
outputArg =zeros(i,n);
[outputArg_row,outputArg_col]=size(outputArg);
mapping_result = outputArg;
%%  cml_3d
%% 赋值
mapping_result(1,1)=0.1;
mapping_result(2,1)=0.2;
mapping_result(3,1)=0.3;
mapping_result(4,1)=0.5;
mapping_result(5,1)=0.6;
% mapping_result(6,1)=mapping_result(1,1);
%%  CML_3D函数体
% for col= 2:n
%     for row = 1:i
%         if (row ==1)
%             mapping_result(col+1,row)=0.3*F(mapping_result(col-1,row))+0.15*F(mapping_result(col-1,row+1))+0.15*F(mapping_result(col-1,i));
%         else if (row==i)
%                 mapping_result(col+1,row)=0.3*F(mapping_result(col-1,row))+0.15*F(mapping_result(col-1,1))+0.15*F(mapping_result(col-1,row-1));
%             else
%                 mapping_result(col+1,row)=0.3*F(mapping_result(col-1,row))+0.15*F(mapping_result(col-1,row+1))+0.15*F(mapping_result(col-1,row-1));
%             end
%         end
%         %   mapping_result(outputArg_row,col)=mapping_result(1,col);
%         % mapping_result(outputArg_row,outputArg_col+)
%         %  outputArg(n*i);
%         % mapping_result(row,col+1)=0.3*F(mapping_result(row,col))+0.7*F(mapping_result(row+1,col));
%     end
% end
%%   CML_3D函数体
for col =2:n
    for row = 1:i
        if(row == 1)
         mapping_result(row,col)= 0.5*F(mapping_result(row,col-1))+1/2*0.5*(F(mapping_result(i,col-1))+F(mapping_result(row+1,col-1)));
        else if (row==i)
                mapping_result(row,col)= 0.5*F(mapping_result(row,col-1))+1/2*0.5*(F(mapping_result(row-1,col-1))+F(mapping_result(1,col-1))); 
            else
                mapping_result(row,col)= 0.5*F(mapping_result(row,col-1))+0.5*1/2*(F(mapping_result(row-1,col-1))+F(mapping_result(row+1,col-1))); 
            end
        end 
     end
end


