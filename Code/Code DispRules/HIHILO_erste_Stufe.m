%basierend auf 414_Wang und Sortierung LPT, wie 407_leisten HI/HILO -->
%Extreme Unterschiede zuerst

% PI=[196   194   136   180    58   126   154    42   144   172;
% 4    28    32    44    47    47    56    56    81    99];

[s,n]=size(PI);
%m=s+1;

% n=8;
% m=2;

%PI=[PI;sum(PI)]
%B=sum(PI);
B=PI;
[~,H]=sort(B(1,:),'descend');
B=B(:,H);



PI2=zeros(size(PI));

for j=1:n,
        
    if mod(j,2)==0, %gerader Index
       [~,IndexL]=min(B(1,:));
       PI2(:,j)=B(:,IndexL);%PI2=gerade
       B(:,IndexL)=nan;
       
    else
        [~,IndexH]=max(B(1,:));
        PI2(:,j)=B(:,IndexH);%PI3=ungerade
        B(:,IndexH)=nan;
    end
      
    
    
end

% zur Ausgabe der optimale Reihenfolge
for i = 1:n
    for j= 1:n

      if PI2(:,i) == PI(:,j)
         
        g(i,j) = j;
        
      else 
        g(i,j) = 0;
      end
      
    end
end

%%%das hier ist die optimale Reihenfolge
schedule3 = sum(g');

PI=PI2;
