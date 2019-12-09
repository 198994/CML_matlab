q= imread('1.jpg');
[x,y,z]=size(q);
 m= 1:x;
 n= 1:y;
% % img=img(:,:,1);
% hold on;
% % for m=1:x
% %     for n =1:y
% plot3(m,n,img(:,:,1),'k');
% %     end
% % end
% q1=length(q(:,1,1));q2=length(q(1,:,1));
% x=q1:-1:1;y=1:q2;

% [X,Y]=meshgrid(x,y);
% plot3(X,Y,q(:,:,2),'x')
z=q(:,:,1);
surf(n,m,q(:,:,3));
