

 s=90;
htt=3;
 %k=90;
% % 
% %Makespan
% % M=avgmakespan;
% % [~,I]=sort(M); 
% % 
% % makespan=makespan(:,I);
% % avgmakespan=avgmakespan(:,I);
% % 
% % %Flowtime
% % F=avgflowtime;
% % [~,H]=sort(F); 
% % 
% % flowtime=flowtime(:,H);
% % avgflowtime=avgflowtime(:,H);
% 

% p1 = [0.0012	0	0.1788	0.2912	0	0.0013	0	0.1814	0.4129	0	0.0294	0.3228	0.2514	0.0002	0	0.2912	0.0071	0.1401	0.0002	0	0.0102	0	0.1562	0];
% 
%v1=[-1.5674639000	-11.7258879077	-0.0388589475	-0.1041747641	-0.0430653911	-0.9388140496	-0.2746979354	-0.3510111859	-0.3982140311	-0.9575241824	-0.2108694330	-1.7363254285	-3.6930542468	-3.0157478156	-4.2361558741	-26.7344421866	-1.5001445369	-7.3146222360	-0.0106046388	-1.3438089041	-0.4740999512	-0.1554736804	-0.1988954318	-0.8664490795	-0.0068350267	-0.1889449222	-0.2077544658	-0.4503192510	-1.1194225889	-1.2013412021	-1.0909068872	-17.7894790543	-2.9936583668	-0.9279723189	-0.2563051214	-2.6729346710	-9.7350746089	-4.2940142782	-0.2849128745	-0.4126223971	-0.3340536472	-0.0192692712	-0.4138538876	-0.2649364873	-0.2394773527	-0.0144401129	-1.2303258645	-5.6711969480	-2.2433405795	-1.9653519633	-26.5928365234	-2.5622741563	-2.3358385204	-0.1072833035	-2.4714243455	-9.8595356075	-2.2717501004	-0.2757918650	-0.3445355600	-0.0016420028	-0.2180637374	-0.1741594110	-0.1800111750	-0.2886814479	-0.0071354307	-0.0212269556	-0.9397599043	-0.3505485755	-1.7345765816	-19.3236612256	-3.3094221804	-1.7009401538	-3.2536750003	-0.8711676017	-1.4406081027	-0.0644511844	-2.2501186230	-1.5346138476	-1.5845635639	-1.0509449411	-2.7972261018	-0.0891460160	-1.4468407078	-7.0859252500];
% 
%[~,n]=size(v1);

 filename = 'Ergebnisse.xlsx';
% % % %sheet = Tabelle2;

 xlRange = 'B281:T370';
% % % % 
 
 makespanGes = xlsread(filename, 'Flowtime_200', xlRange);
 

 %Index A1FAM
 %I=[2 3 1 4 16 13 15 14 6 5 7 8 12 9 10 11];
 
 %[~,ind]=sort(I);
%  makespan=makespan(:,ind);
%  makespan=makespan(:,1:3);

%A1 MinV
%makespan=[makespanGes(:,3),makespanGes(:,1), makespanGes(:,11)];
%A2 FAM
makespan=[makespanGes(:,1),makespanGes(:,18), makespanGes(:,17)];

 
% % % 
% % 
% 
%avgmakespan=sum(makespan(1:k,:))/k;
% 
% [~,I]=sort(avgmakespan); 
% 
% makespan=makespan(:,I);
% avgmakespan=avgmakespan(:,I);
% 
 for ht=1:htt
% % 
 if ht < htt,
 zm = makespan(:,ht)-makespan(:,ht+1);
% %  %zf=flowtime(:,ht)-flowtime(:,ht+1);
% %  
 else
 zm = makespan(:,1)-makespan (:,htt);
% %     %zf=flowtime(:,1)-flowtime (:,htt);
 end
% % %  nbins=15;
% % % h=histogram(z,nbins)
% % %Nbins = morebins(h);
 zmmittel=sum(zm)/s;
% % %zfmittel=sum(zf)/s;
% % 
% % %  
 ym=(zm(:,1)-zmmittel).^2;
% % %yf=(zf(:,1)-zfmittel).^2;
% % 
 xm=sum(ym)/(s-1);
% % % %xf=sum(yf)/(s-1);
% % % % 
 vm (1,ht)= zmmittel/sqrt(xm)* sqrt(s); %v entspricht Wert tstat
% % %vf(1,ht)=zfmittel/sqrt(xf)* sqrt(s);
 end
% % 
    filename='Ergebnisse.xlsx';
   xlRange='X111';
   xlswrite(filename,vm, 'HT_F_kurz',xlRange);

% % % xlRange='BA64';
% % xlswrite(filename,avgflowtime, 'Hypothesentest_F',xlRange);
% 
% 
% xlRange='B2';
% xlswrite(filename,avgmakespan, 'HT 10',xlRange);
% 
% 
% xlRange='B3';
% xlswrite(filename,makespan, 'HT 10',xlRange);
% 
% xlRange='S3';
% xlswrite(filename,zm, 'HT 10',xlRange);
% % xlRange='BA66';
% xlswrite(filename,vf, 'Hypothesentest_F',xlRange);


%Matlab t-statistik
% %[h,p,ci,stats]=ttest(makespan(:,1),makespan(:,2))



%Sortierung p-Werte:

% filename = 'Ergebnisse.xlsx';
% % % %sheet = Tabelle2;
% xlRange1 = 'B8:BW8';
% xlRange2 = 'B6:BW6';
% % % % 
% p = xlsread(filename, 'Hypothesentest_M', xlRange1);
% v= xlsread(filename, 'Hypothesentest_M', xlRange2);
% 
% v1=v1*(-1);
% [~,I]=sort(v1);
% v2=v1(:,I);
% 
% % zur Ausgabe der optimale Reihenfolge
% for i = 1:n
%     for j= 1:n
% 
%       if v2(:,i) == v1(:,j)
%          
%         v(1,j) = i;
%         
%      end
%       
%     end
% end
% v
% 
% %%%das hier ist die optimale Reihenfolge
% %schedule2 = sum(g')
% 
% % for i = 1:n
% %     for j= 1:n
% % 
% %       if p1(:,i) == p2(:,j)
% %          
% %         p(:,i) = j;
% %         
% %       end
% %       
% %     end
% % end
% 
% 
% % 
% % v=v*(-1);
% % [~,H]=sort(v)
% % 
% % xlRange='B9';
% % xlswrite(filename,I, 'Hypothesentest_M',xlRange);
% % xlRange='B10';
% % xlswrite(filename,H, 'Hypothesentest_M',xlRange);
% % 
clear
clc

