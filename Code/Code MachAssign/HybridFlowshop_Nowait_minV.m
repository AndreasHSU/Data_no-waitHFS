% Maschinenzuordnung erfolgt nach minimaler Verzögerung 
% 
% m=3; % Aufträge/Spalten/j
% n=8; % Maschinen/Zeilen/i
% l=m-1;
% s=10; % Zufallszahlen
% w=0;
% 

% idletime1=zeros(1,n);
% idletime2=zeros(1,n);

%PI= [144	154	42	180	194	58	126	196	172	136; 81	56	56	44	28	47	47	4	99	32];
        
%PI=[72 77 21 90 97 29 63 98 86 68; 81 56 56 44 28 47 47 4 99 32];

% PI=[196   194   136   180    58   126   154    42   144   172;
%       4    28    32    44    47    47    56    56    81    99];

[s,n]=size(PI);
m=s+1;

C=zeros(m,n);
idletimeminV=zeros(m+1,n+1);


 for j=1:n,  
                if j==1,        %Zuordnung job 1 zur ersten Maschine
                    
                    C(1,j)=PI(1,j);
                    S(1,j)=C(1,j)-PI(1,j);
                    C(m,j)=sum(PI(:,j));
                    S(m,j)=C(m,j)-PI(s,j);
                    
                    idletimeminV(m,j)=PI(1,j); %Front idle M3
                    WTF(1,j)= C(1,j)-PI(1,j);
                    WTC(1,j)= C(m,j)-PI(s,j)-C(1,j);
                end
                
        if j>1,
                    
                    x =C(m,j-1)- PI(1,j); %frühster Startzeitpunkt Job
                    
                   [wert,~]=max(C(1:m-1,1:j-1),[],2); %Fertigstellungszeitpunkt Job j-1 auf Stufe 1
                   
                   idle = x-wert;
               
                
                if (idle(1,1)<0) && (idle(2,1)>=0), %Verzögerung Stufe 2
                    [wert1,zeile]=max(idle);
                        C(zeile,j)= C(m,j-1);  
                        S(zeile,j) = C(zeile,j)-PI(1,j);
                        idletimeminV(zeile,j)=idle(zeile,1); 
                end
                
                if ((idle(2,1)<0) && (idle(1,1)>=0)), %Verzögerung Maschine 1, erste Stufe
                    [wert2,zeile]=max(idle);
                        C(zeile,j)= C(m,j-1); 
                        S(zeile,j) = C(zeile,j)-PI(1,j);
                        idletimeminV(zeile,j)=idle(zeile,1);
                end
                
                if all (idle<0), %Idle Time Stufe 2
                    [wert3,zeile]=max(idle);
                        C(zeile,j)= wert(zeile,1) + PI(1,j);
                        S(zeile,j) = C(zeile,j)-PI(1,j);
                        idletimeminV(m,j)=abs(idle(zeile,1));%Betrag!
                end
                
                if all(idle>=0), % Verzögerung Stufe 1 Maschine 1 oder 2, min Verzögerung wählen
                    [wert4,zeile]=min(idle);
                        C(zeile,j)=C(m,j-1);
                        S(zeile,j) = C(zeile,j)-PI(1,j);
                        idletimeminV(zeile,j)=idle(zeile,1);
                end
                
                C(m,j)=C(zeile,j) + PI(2,j);
                S(m,j)=C(m,j)-PI(s,j);
                WTF(1,j)=C(zeile,j)-PI(1,j);
                WTC(1,j)=C(m,j)-PI(s,j)-C(zeile,j);
                
                
        end
       
%                          idletime(zeile,j)=C(zeile,j)-(wert2 +PI(1,j));
%                     idletime(m,j)=C(m,j)-(C(m,j-1)+PI(m-1,j));       
%                     
%                     C(zeile,j)= max((wert2+A(1,j)),C(m,j-1));
%                     
%                     C(m,j)= max(C(zeile,j),C(m,j-1))+A(m-1,j);
%                 
%                     VerzoegerungStufe1(j)=C(zeile,j)-(wert2 +A(1,j));
%                     VerzoegerungStufe2(j)=C(m,j)-(C(m,j-1)+A(m-1,j));
%                 end
%                                     
 end
 
  for j=1:n,
 WTB(1,j)=C(m,n)-C(m,j);
 end
 
WT=[WTF;WTC;WTB];

    idletimeminV(1:m,n+1)=C(m,n)-max(C(1:m,:),[],2);% Back idle
%     idletimeminV(1:m,n+2)=sum(idletimeminV(1:m,1:n+1),2);
%     idletimeminV(m+1,n+2)=sum(idletimeminV(1:m,n+2));
    
%Ausgabe Idle Time je Maschine
    frontidletime=sum(idletimeminV(1:m,1:2),2); 
    coreidletime=sum(idletimeminV(1:m,3:n),2);
    backidletime=idletimeminV(1:m,n+1);
   
%5. Ausgabe Ergebnis:
 
%  makespan=C(m,j);
%  flowtime=sum(C(m,:));
 


