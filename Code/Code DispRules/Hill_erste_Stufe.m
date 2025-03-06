% PI=[196   194   136   180    58   126   154    42   144   172;
% 4    28    32    44    47    47    56    56    81    99];

[s,n]=size(PI);
%m=s+1;

% n=8;
% m=3;

%PI=[PI;sum(PI)]
%B=sum(PI);
B=PI(1,:);


PI2=zeros(size(PI));
PI3=zeros(size(PI));




for j=1:n,
    
    [~,Index]=min(B);
    
    if mod(j,2)==0, %gerader Index
       PI2(:,j)=PI(:,Index);%PI2=gerade
       
    else
        PI3(:,j)=PI(:,Index);%PI3=ungerade
    end
      
    B(1,Index)=9999999;
    
end


[~,col]= find(PI2==0); 
PI2(:,col)=[];
%PI2=[PI2;sum(PI2)];

%[~,IndexPI2]=sort(PI2(m,:), 'descend');
[~,IndexPI2]=sort(PI2(1,:), 'descend');
PI2=PI2(:,IndexPI2);


[~,col]= find(PI3==0); 
PI3(:,col)=[];
%PI3=[PI3;sum(PI3)];

%[~,IndexPI3]=sort(PI3(m,:));
[~,IndexPI3]=sort(PI3(1,:));
PI3=PI3(:,IndexPI3);

PI4=[PI3,PI2];

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
schedule2 = sum(g')

PI=PI4;

