%basierend auf 414_Wang und Sortierung LPT, wie 407_leisten HI/HILO -->
%Extreme Unterschiede zuerst

% PI=[196   194   136   180    58   126   154    42   144   172;
% 4    28    32    44    47    47    56    56    81    99];

[s,n]=size(PI);
%m=s+1;

% n=8;
% m=3;

D=[PI;sum(PI)];
B=sum(PI);

%B=PI;

%dieser Schritt wird nicht benötigt, aber einfacher für das Nachvollziehen:
% [~,H]=sort(D(3,:),'descend');
% D=D(:,H);
% B=B(:,H);



PI2=zeros(size(D));

for j=1:n,
        
    if mod(j,2)==0, %gerader Index
       [~,IndexL]=min(B);
       PI2(:,j)=D(:,IndexL);%PI2=gerade
       B(:,IndexL)=nan;
       
    else
        [~,IndexH]=max(B);
        PI2(:,j)=D(:,IndexH);%PI3=ungerade
        B(:,IndexH)=nan;
    end
      
    
    
end

PI=PI2;
PI(3,:)=[];
