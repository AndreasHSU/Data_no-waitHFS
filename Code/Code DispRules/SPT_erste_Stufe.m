% function [ PI ] = SPT_erste_Stufe( PI )
%  
% %SOA_10_2_2;
% 
% B=evalin('base','PI'); %Aufrufen von SOA
% 
% B= PI(1,:);
% [~,I]=sort(B); 
% PI=PI(:,I);
% end
%PI =[90 28 57 92 31 83 68 6 44 42 9 9 35 94 65 9 33 12 8 23; 15 96 54 98 39 67 95 41 92 66 17 69 14 45 90 47 71 58 35 67];
%  PI =[
% 
%    144   154    42   180   194    58   126   196   172   136;
%     81    56    56    44    28    47    47     4    99    32];   

[s,n]=size(PI);

B=PI(1,:);
[~,I]=sort(B);
PI4=PI(:,I);

% zur Ausgabe der optimale Reihenfolge
for i = 1:n
    for j= 1:n

      if PI4(:,i) == PI(:,j)
         
        g(i,j) = j;
        
      else 
        g(i,j) = 0;
      end
      
    end
end

%%%das hier ist die optimale Reihenfolge
schedule1 = sum(g')

PI=PI4;
