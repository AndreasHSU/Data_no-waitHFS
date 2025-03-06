%PI=[72 77 21 90 97 29 63 98 86 68; 81 56 56 44 28 47 47 4 99 32];
%PI =[90 28 57 92 31 83 68 6 44 42 9 9 35 94 65 9 33 12 8 23; 15 96 54 98 39 67 95 41 92 66 17 69 14 45 90 47 71 58 35 67];
% PI =[
% 
%    144   154    42   180   194    58   126   196   172   136;
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
 
 %B=p(1,:);
 p=sum(p);
 
 B= p;
% [~,I]=sort(p,'descend'); 
% PI=PI(:,I);

% [~,I]=sort(b,'descend'); 
% PI=PI(:,I);


PI2=zeros(size(B));
PI3=zeros(size(B));
PI4=zeros(size(PI));
PI5=zeros(size(PI));



for j=1:n,
    
    [~,Index]=min(B);
    
    if mod(j,2)==0, %gerader Index
       PI2(:,j)=B(:,Index);%PI2=gerade
       PI4(:,j)=PI(:,Index);
       
    else
        PI3(:,j)=B(:,Index);%PI3=ungerade
        PI5(:,j)=PI(:,Index);
    end
      
    B(1,Index)=9999999;
    
end


[~,col]= find(PI2==0); 
PI2(:,col)=[];
%PI2=[PI2;sum(PI2)];
[~,col]= find(PI4==0); 
PI4(:,col)=[];

% %[~,IndexPI2]=sort(PI2(m,:), 'descend');
[~,IndexPI2]=sort(PI2(1,:), 'descend');
PI2=PI2(:,IndexPI2);
PI4=PI4(:,IndexPI2);
% 
% [~,IndexPI4]=sort(PI4(1,:), 'descend');
% PI2=PI2(:,IndexPI2);
% 
[~,col]= find(PI3==0); 
PI3(:,col)=[];
%PI3=[PI3;sum(PI3)];
[~,col]= find(PI5==0); 
PI5(:,col)=[];

%[~,IndexPI3]=sort(PI3(m,:));
[~,IndexPI3]=sort(PI3(1,:));
PI3=PI3(:,IndexPI3);
PI5=PI5(:,IndexPI3);
% 
BHill=[PI3,PI2];
PI=[PI5,PI4];

