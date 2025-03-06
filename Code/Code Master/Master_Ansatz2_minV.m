
Z = uigetdir('C:\Users\Caroline\Documents\MATLAB\SOA\*.txt');%Pfad Zielordner
f=dir([Z '\*.txt']); %Dateinamen auslesen von dem gewählten Ordner
f = strcat([Z '\'], {f.name}); %f={f.name};  %/Dateiname extrahieren


%makespan=zeros(length(f),3);
flowtime=zeros(length(f),3);

% ITCM3=zeros(length(f),19); %Idletime Core Stufe 2
% ITFM3=zeros(length(f),19); %Idletime Front Stufe 2
% ITBM3=zeros(length(f),19); %Idletime Back Stufe 2
% 
% ITCM12=zeros(length(f),19); %Idletime Core Stufe 1
% ITFM12=zeros(length(f),19); %Idletime Front Stufe 1
% ITBM12=zeros(length(f),19); %Idletime Back Stufe 1


for k=1:length(f),
%Matrix=dlmread(f{k});
%Matrix=dlmread(f{k},'',[2 0 51 4]);
%Matrix=dlmread(f{k},'',[2 0 101 4]);
%Matrix=dlmread(f{k},'',[2 0 151 4]);
Matrix=dlmread(f{k},'',[2 0 201 4]);

PI=[Matrix(:,2), Matrix(:,4)];%PI ist meine Ausgangsmatrix
PI=PI'; %Matrix drehen
PI=[(PI(1,:)*2);PI(2,:)]; %Kapazität Stufe 1 verdoppeln
PID=PI; %Dummy


% %Dispatching Rules
% %1. SPT
  SPT_Gesamt;
  HybridFlowshop_Nowait_minV;
% 
     %makespan(k,1)=C(m,n);
     flowtime(k,1)=sum(C(m,:));
% 
%     ITCM3(k,1)=coreidletime(3,1);
%     ITFM3(k,1)=frontidletime(3,1);
%     ITBM3(k,1)=backidletime(3,1);
%     
%     ITCM12(k,1)=sum(coreidletime(1:2,1));
%     ITFM12(k,1)=sum(frontidletime(1:2,1));
%     ITBM12(k,1)=sum(backidletime(1:2,1));
%     
 PI=PID;
%  
% %1b. SPT
  SPT_Gesamt;
  HybridFlowshop_Nowait_FAM;
% 
     %makespan(k,3)=C(m,n);
    flowtime(k,3)=sum(C(m,:));
% 
%     ITCM3(k,1)=coreidletime(3,1);
%     ITFM3(k,1)=frontidletime(3,1);
%     ITBM3(k,1)=backidletime(3,1);
%     
%     ITCM12(k,1)=sum(coreidletime(1:2,1));
%     ITFM12(k,1)=sum(frontidletime(1:2,1));
%     ITBM12(k,1)=sum(backidletime(1:2,1));
%     
 PI=PID;

%  %2. LPT
% LPT_Gesamt;
% HybridFlowshop_Nowait_minV;
% %  
%     makespan(k,2)=C(m,n);
%     flowtime(k,2)=sum(C(m,:));
%     
%     ITCM3(k,2)=coreidletime(3,1);
%     ITFM3(k,2)=frontidletime(3,1);
%     ITBM3(k,2)=backidletime(3,1);
%     
%     ITCM12(k,2)=sum(coreidletime(1:2,1));
%     ITFM12(k,2)=sum(frontidletime(1:2,1));
%     ITBM12(k,2)=sum(backidletime(1:2,1));
%     
%  PI=PID;

%    %3. Hill
% Hill_gesamt;
% HybridFlowshop_Nowait_minV;
% 
%     makespan(k,1)=C(m,n);
%     flowtime(k,3)=sum(C(m,:));
% 
%     ITCM3(k,3)=coreidletime(3,1);
%     ITFM3(k,3)=frontidletime(3,1);
%     ITBM3(k,3)=backidletime(3,1);
%     
%     ITCM12(k,3)=sum(coreidletime(1:2,1));
%     ITFM12(k,3)=sum(frontidletime(1:2,1));
%     ITBM12(k,3)=sum(backidletime(1:2,1));
    
% PI=PID;
% 
% %4. Valley
% Valley_gesamt;
% HybridFlowshop_Nowait_minV;
%  
%     makespan(k,4)=C(m,n);
%     flowtime(k,4)=sum(C(m,:));
%     
%     ITCM3(k,4)=coreidletime(3,1);
%     ITFM3(k,4)=frontidletime(3,1);
%     ITBM3(k,4)=backidletime(3,1);
%     
%     ITCM12(k,4)=sum(coreidletime(1:2,1));
%     ITFM12(k,4)=sum(frontidletime(1:2,1));
%     ITBM12(k,4)=sum(backidletime(1:2,1));
% 
%     
% PI=PID;
% % 
% % %5. HIHILO
% HIHILO_gesamt;
% HybridFlowshop_Nowait_minV;
%  
%     makespan(k,5)=C(m,n);
%     flowtime(k,5)=sum(C(m,:));
% 
%     ITCM3(k,5)=coreidletime(3,1);
%     ITFM3(k,5)=frontidletime(3,1);
%     ITBM3(k,5)=backidletime(3,1);
%     
%     ITCM12(k,5)=sum(coreidletime(1:2,1));
%     ITFM12(k,5)=sum(frontidletime(1:2,1));
%     ITBM12(k,5)=sum(backidletime(1:2,1));
%     
% PI=PID;
% % 
% % %6. HILOHI
% HILOHI_gesamt;
% HybridFlowshop_Nowait_minV;
%  
%     makespan(k,6)=C(m,n);
%     flowtime(k,6)=sum(C(m,:));
% 
%     ITCM3(k,6)=coreidletime(3,1);
%     ITFM3(k,6)=frontidletime(3,1);
%     ITBM3(k,6)=backidletime(3,1);
%     
%     ITCM12(k,6)=sum(coreidletime(1:2,1));
%     ITFM12(k,6)=sum(frontidletime(1:2,1));
%     ITBM12(k,6)=sum(backidletime(1:2,1));
%     
% PI=PID;
% % 
% % %7. LOHILO
% LOHILO_gesamt;
% HybridFlowshop_Nowait_minV;
%  
%     makespan(k,7)=C(m,n);
%     flowtime(k,7)=sum(C(m,:));
%     
%     ITCM3(k,7)=coreidletime(3,1);
%     ITFM3(k,7)=frontidletime(3,1);
%     ITBM3(k,7)=backidletime(3,1);
%     
%     ITCM12(k,7)=sum(coreidletime(1:2,1));
%     ITFM12(k,7)=sum(frontidletime(1:2,1));
%     ITBM12(k,7)=sum(backidletime(1:2,1));
%     
% PI=PID;
% % 
% % %8. LOLOHI
% LOLOHI_gesamt;
% HybridFlowshop_Nowait_minV;
%  
%     makespan(k,8)=C(m,n);
%     flowtime(k,8)=sum(C(m,:));
%     
%     ITCM3(k,8)=coreidletime(3,1);
%     ITFM3(k,8)=frontidletime(3,1);
%     ITBM3(k,8)=backidletime(3,1);
%     
%     ITCM12(k,8)=sum(coreidletime(1:2,1));
%     ITFM12(k,8)=sum(frontidletime(1:2,1));
%     ITBM12(k,8)=sum(backidletime(1:2,1));
%     
% PI=PID;
% 
% % %9. absDiff SPT
% SPT_absolute_Differenz_gesamt;
% HybridFlowshop_Nowait_minV;
%  
%     makespan(k,9)=C(m,n);
%     flowtime(k,9)=sum(C(m,:));
%     
%     ITCM3(k,9)=coreidletime(3,1);
%     ITFM3(k,9)=frontidletime(3,1);
%     ITBM3(k,9)=backidletime(3,1);
%     
%     ITCM12(k,9)=sum(coreidletime(1:2,1));
%     ITFM12(k,9)=sum(frontidletime(1:2,1));
%     ITBM12(k,9)=sum(backidletime(1:2,1));
%     
%  PI=PID;
%  
% % %10. absDiff LPT
% LPT_absolute_Differenz_gesamt;
% HybridFlowshop_Nowait_minV;
%  
%     makespan(k,10)=C(m,n);
%     flowtime(k,10)=sum(C(m,:));
%     
%     ITCM3(k,10)=coreidletime(3,1);
%     ITFM3(k,10)=frontidletime(3,1);
%     ITBM3(k,10)=backidletime(3,1);
%     
%     ITCM12(k,10)=sum(coreidletime(1:2,1));
%     ITFM12(k,10)=sum(frontidletime(1:2,1));
%     ITBM12(k,10)=sum(backidletime(1:2,1));
%     
% PI=PID;
% % 
% % %11. absDiff Hill
% Hill_absolute_Differenz_gesamt;
% HybridFlowshop_Nowait_minV; 
%  
%     makespan(k,11)=C(m,n);
%     flowtime(k,11)=sum(C(m,:));
%     
%     ITCM3(k,11)=coreidletime(3,1);
%     ITFM3(k,11)=frontidletime(3,1);
%     ITBM3(k,11)=backidletime(3,1);
%     
%     ITCM12(k,11)=sum(coreidletime(1:2,1));
%     ITFM12(k,11)=sum(frontidletime(1:2,1));
%     ITBM12(k,11)=sum(backidletime(1:2,1));
%     
% PI=PID;
% 
% % %12. absDiff Valley
% Valley_absolute_Differenz_gesamt;
% HybridFlowshop_Nowait_minV;
%  
%     makespan(k,12)=C(m,n);
%     flowtime(k,12)=sum(C(m,:));
%     
%     ITCM3(k,12)=coreidletime(3,1);
%     ITFM3(k,12)=frontidletime(3,1);
%     ITBM3(k,12)=backidletime(3,1);
%     
%     ITCM12(k,12)=sum(coreidletime(1:2,1));
%     ITFM12(k,12)=sum(frontidletime(1:2,1));
%     ITBM12(k,12)=sum(backidletime(1:2,1));
%     
% PI=PID;
% 
% %13. absDiff HIHILO
% HIHILO_absolute_Differenz_gesamt;
% HybridFlowshop_Nowait_minV;
%  
%     makespan(k,13)=C(m,n);
%     flowtime(k,13)=sum(C(m,:));
%     
%     ITCM3(k,13)=coreidletime(3,1);
%     ITFM3(k,13)=frontidletime(3,1);
%     ITBM3(k,13)=backidletime(3,1);
%     
%     ITCM12(k,13)=sum(coreidletime(1:2,1));
%     ITFM12(k,13)=sum(frontidletime(1:2,1));
%     ITBM12(k,13)=sum(backidletime(1:2,1));
%     
% PI=PID;
% 
% %14. absDiff HILOHI
% HILOHI_absolute_Differenz_gesamt;
% HybridFlowshop_Nowait_minV; 
%  
%     makespan(k,14)=C(m,n);
%     flowtime(k,14)=sum(C(m,:));
%     
%     ITCM3(k,14)=coreidletime(3,1);
%     ITFM3(k,14)=frontidletime(3,1);
%     ITBM3(k,14)=backidletime(3,1);
%     
%     ITCM12(k,14)=sum(coreidletime(1:2,1));
%     ITFM12(k,14)=sum(frontidletime(1:2,1));
%     ITBM12(k,14)=sum(backidletime(1:2,1));
%     
% PI=PID;
% 
% %15. absDiff LOHILO
% LOHILO_absolute_Differenz_gesamt;
% HybridFlowshop_Nowait_minV; 
%  
%     makespan(k,15)=C(m,n);
%     flowtime(k,15)=sum(C(m,:));
%     
%     ITCM3(k,15)=coreidletime(3,1);
%     ITFM3(k,15)=frontidletime(3,1);
%     ITBM3(k,15)=backidletime(3,1);
%     
%     ITCM12(k,15)=sum(coreidletime(1:2,1));
%     ITFM12(k,15)=sum(frontidletime(1:2,1));
%     ITBM12(k,15)=sum(backidletime(1:2,1));
%     
% PI=PID;
% 
% % %16. absDiff LOLOHI
% LOLOHI_absolute_Differenz_gesamt;
% HybridFlowshop_Nowait_minV;  
%  
%     makespan(k,16)=C(m,n);
%     flowtime(k,16)=sum(C(m,:));
%     
%     ITCM3(k,16)=coreidletime(3,1);
%     ITFM3(k,16)=frontidletime(3,1);
%     ITBM3(k,16)=backidletime(3,1);
%     
%     ITCM12(k,16)=sum(coreidletime(1:2,1));
%     ITFM12(k,16)=sum(frontidletime(1:2,1));
%     ITBM12(k,16)=sum(backidletime(1:2,1));
%     
% PI=PID;

%Heuristiken

% %17.NEH
% NEH2; 
% HybridFlowshop_Nowait_minV;
% 
%     makespan(k,2)=C(m,n);
%     flowtime(k,17)=sum(C(m,:));
%     
%     ITCM3(k,17)=coreidletime(3,1);
%     ITFM3(k,17)=frontidletime(3,1);
%     ITBM3(k,17)=backidletime(3,1);
%     
%     ITCM12(k,17)=sum(coreidletime(1:2,1));
%     ITFM12(k,17)=sum(frontidletime(1:2,1));
%     ITBM12(k,17)=sum(backidletime(1:2,1));
    
% PI=PID;

% %18. LR
 LR;   
HybridFlowshop_Nowait_minV;
%  
   %makespan(k,2)=C(m,n);
     flowtime(k,2)=sum(C(m,:));
%     
%     ITCM3(k,18)=coreidletime(3,1);
%     ITFM3(k,18)=frontidletime(3,1);
%     ITBM3(k,18)=backidletime(3,1);
%     
%     ITCM12(k,18)=sum(coreidletime(1:2,1));
%     ITFM12(k,18)=sum(frontidletime(1:2,1));
%     ITBM12(k,18)=sum(backidletime(1:2,1));
%     
% PI=PID;

%19. Gilgom
% LGILGOM3;   
% HybridFlowshop_Nowait_minV; 
%  
%     makespan(k,3)=C(m,n);
%     flowtime(k,19)=sum(C(m,:));
%     
%     ITCM3(k,19)=coreidletime(3,1);
%     ITFM3(k,19)=frontidletime(3,1);
%     ITBM3(k,19)=backidletime(3,1);
%     
%     ITCM12(k,19)=sum(coreidletime(1:2,1));
%     ITFM12(k,19)=sum(frontidletime(1:2,1));
%     ITBM12(k,19)=sum(backidletime(1:2,1));
    
% % %PI=PID;
 end
% 
ARPD_Ansatz1 %VORSICHT t LAUFPARAMETER ÄNDERN
% 
% 
% avgmakespan=sum(makespan(1:k,:))/k;
% %  
% avgflowtime=sum(flowtime(1:k,:))/k;
% %  
% 
% avgITCM3=sum(ITCM3(1:k,:))/k;
% avgITFM3=sum(ITFM3(1:k,:))/k;
% avgITBM3=sum(ITBM3(1:k,:))/k;
% % % 
% avgITCM12=sum(ITCM12(1:k,:))/k;
% avgITFM12=sum(ITFM12(1:k,:))/k;
% avgITBM12=sum(ITBM12(1:k,:))/k;
% % % 

% filename='Ergebnisse.xlsx';
% 
% xlRange='U28';
% xlswrite(filename,avgmakespan, '200',xlRange);
% xlRange='U30';
% xlswrite(filename,avgflowtime,'200',xlRange);
% 
% xlRange='U38';
% xlswrite(filename,avgDevMakespan,'200',xlRange);
% xlRange='U40';
% xlswrite(filename,avgDevFlowtime,'200',xlRange);
% 
% xlRange='U64';
% xlswrite(filename,besteAnzahlM,'200',xlRange);
% xlRange='U65';
% xlswrite(filename,besteAnzahlF,'200',xlRange);
% 
% xlRange='U66';
% xlswrite(filename,avgITFM12,'200',xlRange);
% xlRange='U67';
% xlswrite(filename,avgITCM12,'200',xlRange);
% xlRange='U68';
% xlswrite(filename,avgITBM12,'200',xlRange);
% 
% xlRange='U70';
% xlswrite(filename,avgITFM3,'200',xlRange);
% xlRange='U71';
% xlswrite(filename,avgITCM3,'200',xlRange);
% xlRange='U72';
% xlswrite(filename,avgITBM3,'200',xlRange);
% % 
% xlRange='B281';
% xlswrite(filename,makespan,'Makespan_200',xlRange);
% xlRange='B281';
% xlswrite(filename,flowtime,'Flowtime_200',xlRange);
% xlRange='B281';
% xlswrite(filename,DevMakespan,'DevMakespan_200',xlRange);
% xlRange='B281';
% xlswrite(filename,DevFlowtime,'DevFlowtime_200',xlRange);
% xlRange='B281';
% xlswrite(filename,AnzahlM,'AnzahlM_200',xlRange);
% xlRange='B281';
% xlswrite(filename,AnzahlF,'AnzahlF_200',xlRange);
% 
% 
% Hypothesentest

besteAnzahlF