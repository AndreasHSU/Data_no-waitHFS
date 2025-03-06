
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
    
    [~,Index]=max(B);
    
    if mod(j,2)==0, %gerader Index
       PI2(:,j)=PI(:,Index);%PI2=gerade
       
    else
        PI3(:,j)=PI(:,Index);%PI3=ungerade
    end
      
    B(1,Index)=0;
    
end


[~,col]= find(PI2==0); 
PI2(:,col)=[];
%PI2=[PI2;sum(PI2)];

%[~,IndexPI2]=sort(PI2(m,:));
[~,IndexPI2]=sort(PI2(1,:));
PI2=PI2(:,IndexPI2);


[~,col]= find(PI3==0); 
PI3(:,col)=[];
%PI3=[PI3;sum(PI3)];

%[~,IndexPI3]=sort(PI3(m,:),'descend');
[~,IndexPI3]=sort(PI3(1,:),'descend');
PI3=PI3(:,IndexPI3);

PI=[PI3,PI2];
