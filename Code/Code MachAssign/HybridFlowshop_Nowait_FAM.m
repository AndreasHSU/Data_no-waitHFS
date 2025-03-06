%function [ C ] = HybridFlowshop_Nowait_FAM( PI )

%SOA_10_2_2;

%B=evalin('base','PI'); %Aufrufen von SOA

%PI=[72 77 21 90 97 29 63 98 86 68; 81 56 56 44 28 47 47 4 99 32];
%PI =[90 28 57 92 31 83 68 6 44 42 9 9 35 94 65 9 33 12 8 23; 15 96 54 98 39 67 95 41 92 66 17 69 14 45 90 47 71 58 35 67];
% % 
% PI=[196   194   136   180    58   126   154    42   144   172;
% 4    28    32    44    47    47    56    56    81    99];

%PI= [144	154	42	180	194	58	126	196	172	136; 81	56	56	44	28	47	47	4	99	32];

% PI =[    42    58   126   136   144   154   180   172   194   196;
%             56    47    47    32    81    56    44    99    28     4];
%SPT_erste_Stufe;

%SPT_zweite_Stufe;
%SPT_Gesamt;
%SPT_absolute_Differenz;

% 
[s,n]=size(PI);
m=s+1;

%  m=3; % Aufträge/Spalten/j
%  n=10; % Maschinen/Zeilen/i
W=0;
% 
C=zeros(m,n);
idletimeFAM=zeros(m+1,n+1);

% idletime1=zeros(1,n);
% idletime2=zeros(1,n);



 for j=1:n,  
                if j==1,        %Zuordnung job 1 zur ersten Maschine
                    
                    C(1,j)=PI(1,j); %ohne releasedates
                    S(1,j)=C(1,j)-PI(1,j);
                    
                    C(m,j)=sum(PI(:,j));
                    S(m,j)=C(m,j)-PI(s,j);
                    
                    idletimeFAM(m,j)=PI(1,j);%Front idle M3
                    WTF(1,j)= C(1,j)-PI(1,j);
                    WTC(1,j)= C(m,j)-PI(s,j)-C(1,j);
                    
                else
                
                    [wert,~]=max(C(1:m-1,1:j-1),[],2);
                    
                    [wert2,zeile]=min(wert);
                    
                    C(zeile,j)= max((wert2+PI(1,j)),C(m,j-1)-W);
                    S(zeile,j) = C(zeile,j)-PI(1,j);
                    
                    C(m,j)= max(C(zeile,j),C(m,j-1))+PI(m-1,j);
                    S(m,j)=C(m,j)-PI(s,j);
                    
                    idletimeFAM(zeile,j)=C(zeile,j)-(wert2 +PI(1,j));
                    idletimeFAM(m,j)=C(m,j)-(C(m,j-1)+PI(m-1,j));
                    
                    WTF(1,j)=C(zeile,j)-PI(1,j);
                    WTC(1,j)=C(m,j)-PI(s,j)-C(zeile,j);
                    
                    %idletime1(j)=C(zeile,j)-(wert2 +PI(1,j));
                    %idletime2(j)=C(m,j)-(C(m,j-1)+PI(m-1,j));
                end
                                    
 end

 for j=1:n,
 WTB(1,j)=C(m,n)-C(m,j);
 end
 
 WT=[WTF;WTC;WTB];
 
idletimeFAM(1:m,n+1)=C(m,n)-max(C(1:m,:),[],2);% Back idle
%     idletimeFAM(1:m,n+2)=sum(idletimeFAM(1:m,1:n+1),2);
%     idletimeFAM(m+1,n+2)=sum(idletimeFAM(1:m,n+2));
%  
%Ausgabe Idle Time je Maschine
frontidletime=sum(idletimeFAM(1:m,1:2),2);
coreidletime=sum(idletimeFAM(1:m,3:n),2);
backidletime=idletimeFAM(1:m,n+1);
%  

 