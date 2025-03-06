Z = uigetdir('C:\Users\Caroline\Documents\MATLAB\SOA\*.txt');%Pfad Zielordner
f=dir([Z '\*.txt']); %Dateinamen auslesen von dem gew‰hlten Ordner
f = strcat([Z '\'], {f.name}); %f={f.name};  %/Dateiname extrahieren


makespan=zeros(length(f),16);
flowtime=zeros(length(f),16);
LBM=zeros(length(f),1);

ITCM3=zeros(length(f),16); %Idletime Core Stufe 2
ITFM3=zeros(length(f),16); %Idletime Front Stufe 2
ITBM3=zeros(length(f),16); %Idletime Back Stufe 2

ITCM12=zeros(length(f),16); %Idletime Core Stufe 1
ITFM12=zeros(length(f),16); %Idletime Front Stufe 1
ITBM12=zeros(length(f),16); %Idletime Back Stufe 1

for k=1:length(f),
 
Matrix=dlmread(f{k});
%Matrix=dlmread(f{k},'',[2 0 51 4]);
%Matrix=dlmread(f{k},'',[2 0 101 4]);
%Matrix=dlmread(f{k},'',[2 0 151 4]);
%Matrix=dlmread(f{k},'',[2 0 201 4]);

PI=[Matrix(:,2), Matrix(:,4)];%PI ist meine Ausgangsmatrix
PI=PI'; %Matrix drehen
PI=[(PI(1,:)*2);PI(2,:)]; %Kapazit‰t Stufe 1 verdoppeln
PID=PI; %Dummy

%Lowerbound Makespan
% LBM(k,1) = max( min(PI(1,:)) + sum(PI(2,:)),(sum(PI(1,:))/2) + min(PI(2,:)));
% LBMakespanHT

%Lowerbound Flowtime
% LBFlowtime

% PI=PID;
% 
%  %1. SPT erste Stufe
 SPT_erste_Stufe;
 HybridFlowshop_Nowait_minV;
 %HybridFlowshop_limwait_minV;
% % 
%     makespan(k,1)=C(m,n);
%     flowtime(k,1)=sum(C(m,:));
    
%     ITCM3(k,1)=coreidletime(3,1);
%     ITFM3(k,1)=frontidletime(3,1);
%     ITBM3(k,1)=backidletime(3,1);
%     
%     ITCM12(k,1)=sum(coreidletime(1:2,1));
%     ITFM12(k,1)=sum(frontidletime(1:2,1));
%     ITBM12(k,1)=sum(backidletime(1:2,1));
  
% WTTF(k,1)=sum(WTF(:,:),2);
% WTTC(k,1)=sum(WTC(:,:),2);
% WTTB(k,1)=sum(WTB(:,:),2);

 PI=PID;
%  
%  %2. LPT erste Stufe
%  LPT_erste_Stufe;
%   HybridFlowshop_Nowait_minV;
 %HybridFlowshop_limwait_minV;

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
% WTTF(k,2)=sum(WTF(:,:),2);
% WTTC(k,2)=sum(WTC(:,:),2);
% WTTB(k,2)=sum(WTB(:,:),2);
% 
%  PI=PID;
%  
%  %3. Hill erste Stufe
 Hill_erste_Stufe;
 HybridFlowshop_Nowait_minV;
 %HybridFlowshop_limwait_minV;
 
%     makespan(k,3)=C(m,n);
%     flowtime(k,3)=sum(C(m,:));
% 
%     ITCM3(k,3)=coreidletime(3,1);
%     ITFM3(k,3)=frontidletime(3,1);
%     ITBM3(k,3)=backidletime(3,1);
%     
%     ITCM12(k,3)=sum(coreidletime(1:2,1));
%     ITFM12(k,3)=sum(frontidletime(1:2,1));
%     ITBM12(k,3)=sum(backidletime(1:2,1));
% WTTF(k,3)=sum(WTF(:,:),2);
% WTTC(k,3)=sum(WTC(:,:),2);
% WTTB(k,3)=sum(WTB(:,:),2);
% 
%  PI=PID;
%  
%  %4. Valley erste Stufe
%  Valley_erste_Stufe; 
%   %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV;
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
%  PI=PID;
%  
%  %5. High Low erste Stufe - groﬂe Unterschiede zuerst
%  HIHILO_erste_Stufe;
%   %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV;
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
%  PI=PID;
%  
% %  %6. Low High erste Stufe - groﬂe Unterschiede zuerst
%  HILOHI_erste_Stufe;
%   %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV;
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
%  PI=PID;
%  
% %  %7. High Low erste Stufe - kleine Unterschiede zuerst
%  LOHILO_erste_Stufe;
%  %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV;
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
%  PI=PID;
%  
% %   %8. Low High erste Stufe - kleine Unterschiede zuerst
%  LOLOHI_erste_Stufe;
%   %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV; 
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
%     
%  PI=PID;
%  
% %  %9. Absolute Differenz SPT erste Stufe
%  SPT_absolute_Differenz_erste_Stufe;
%  %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV;
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
% %  %10. Absolute Differenz LPT erste Stufe
%  LPT_absolute_Differenz_erste_Stufe;
%  %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV;
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
%  PI=PID;
% %  
% %   %11. Absolute Differenz Hill erste Stufe
%   Hill_absolute_Differenz_erste_Stufe;
%   %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV; 
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
%  PI=PID;
%  
% %  %12. Absolute Differenz Valley erste Stufe
%  Valley_absolute_Differenz_erste_Stufe;
%  %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV; 
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
% %  
% %  %13. Absolute Differenz HI/HILO
%  HIHILO_absolute_Differenz_erste_Stufe;
%   %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV;
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
%  PI=PID;
% %  
% %  %14. Absolute Differenz HI/LOHI
%  HILOHI_absolute_Differenz_erste_Stufe;
%   %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV; 
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
%   PI=PID;
% %     
% %  %15. Absolute Differenz LO/HILO
%  LOHILO_absolute_Differenz_erste_Stufe;
%   %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV; 
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
%   PI=PID;
%     
%  
% %  %16. Absolute Differenz LO/LOHI
%  LOLOHI_absolute_Differenz_erste_Stufe;
%   %HybridFlowshop_Nowait_minV;
%  HybridFlowshop_limwait_minV; 
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
    % %  % PI=PID;
end

ARPD_Ansatz1

% avgmakespan=sum(makespan(1:k,:))/k
% 
% avgflowtime=sum(flowtime(1:k,:))/k
%  
% avgITCM3=sum(ITCM3(1:k,:))/k;
% avgITFM3=sum(ITFM3(1:k,:))/k;
% avgITBM3=sum(ITBM3(1:k,:))/k;
% % % 
% avgITCM12=sum(ITCM12(1:k,:))/k;
% avgITFM12=sum(ITFM12(1:k,:))/k;
% avgITBM12=sum(ITBM12(1:k,:))/k;
% % 

% avgWTF=sum(WTTF)/k;
% avgWTC=sum(WTTC)/k;
% avgWTB=sum(WTTB)/k;
% % 
% 
% filename='Ergebnisse.xlsx';
% xlRange='R5';
% xlswrite(filename,avgmakespan, '200',xlRange);
% xlRange='R7';
% xlswrite(filename,avgflowtime,'200',xlRange);
% xlRange='R15';
% xlswrite(filename,avgDevMakespan,'200',xlRange);
% xlRange='R17';
% xlswrite(filename,avgDevFlowtime,'200',xlRange);
% % 
% % % % xlRange='R19';
% % % % xlswrite(filename,avgDevLBM,'200',xlRange);
% % % % xlRange='R21';
% % % % xlswrite(filename,avgDevLBF,'200',xlRange);
% % % % 
% xlRange='R50';
% xlswrite(filename,besteAnzahlM,'200',xlRange);
% xlRange='R51';
% xlswrite(filename,besteAnzahlF,'200',xlRange);
% xlRange='R52';
% xlswrite(filename,avgITFM12,'200',xlRange);
% xlRange='R53';
% xlswrite(filename,avgITCM12,'200',xlRange);
% xlRange='R54';
% xlswrite(filename,avgITBM12,'200',xlRange);
% xlRange='R56';
% xlswrite(filename,avgITFM3,'200',xlRange);
% xlRange='R57';
% xlswrite(filename,avgITCM3,'200',xlRange);
% xlRange='R58';
% xlswrite(filename,avgITBM3,'200',xlRange);
% % 
% xlRange='B95';
% xlswrite(filename,makespan,'Makespan_200',xlRange);
% xlRange='B95';
% xlswrite(filename,flowtime,'Flowtime_200',xlRange);
% xlRange='B95';
% xlswrite(filename,DevMakespan,'DevMakespan_200',xlRange);
% xlRange='B95';
% xlswrite(filename,DevFlowtime,'DevFlowtime_200',xlRange);
% xlRange='B95';
% xlswrite(filename,AnzahlM,'AnzahlM_200',xlRange);
% xlRange='B95';
% xlswrite(filename,AnzahlF,'AnzahlF_200',xlRange);
% 
% xlRange='R3';
% xlswrite(filename,avgWTF,'WTT ITT A1',xlRange);
% xlRange='R13';
% xlswrite(filename,avgWTC,'WTT ITT A1',xlRange);
% xlRange='R23';
% xlswrite(filename,avgWTB,'WTT ITT A1',xlRange); 
% Hypothesentest
% 
