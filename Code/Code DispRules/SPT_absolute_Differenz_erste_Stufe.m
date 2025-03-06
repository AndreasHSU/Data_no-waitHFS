
%PI=[72 77 21 90 97 29 63 98 86 68; 81 56 56 44 28 47 47 4 99 32];
%PI =[90 28 57 92 31 83 68 6 44 42 9 9 35 94 65 9 33 12 8 23; 15 96 54 98 39 67 95 41 92 66 17 69 14 45 90 47 71 58 35 67];
% PI =[  144   154    42   180   194    58   126   196   172   136;
%     81    56    56    44    28    47    47     4    99    32];
% m=3;
% n=20;

[s,n]=size(PI);


% 
   p=zeros(s,n);

 for j=1:n,
        
        for i=1:s,   %rechnen mit m=2, da Maschinen Stufe 1 identisch, aufpassen m=3!                                       
                   
                            
                    p(i,j) = sum(abs((PI(i,j) - PI(i,1:j-1)))) + sum(abs(PI(i,j)-PI(i,j+1:n)));
                                                      
                              
%                     p1 (i,j) = sum(abs((PI(i,j) - PI(i,1:j-1))));
%                     p2 (i,j) = sum(abs(PI(i,j)-PI(i,j+1:n)));
%                     p3        = sum(p1+p2)
% %                     
                
        end
 end
 
 b=p(1,:);
 %p=sum(p);
 
 %B= p;
% [~,I]=sort(p); 
% PI=PI(:,I);

[~,I]=sort(b); 
PI=PI(:,I);
    