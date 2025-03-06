% PI =[
% 
%    144   154    42   180   194    58   126   196   172   136;
%     81    56    56    44    28    47    47     4    99    32];

[m,n]=size(PI);

% A = [12 16 23; 20 10 14; 18 20 10];

%A = [4 7 6 5 12; 12 4 7 2 3; 2 10 6 6 2; 1 9 3 2 14]; aus Vorlesung PM und
%stimmt

%A = [5 3 4 8 12; 9 5 5 1 7; 4 7 1 2 8]; Übung PM - stimmt

%A = [4 1 5 2 5 1 3 3 2 4; 3 5 6 2 1 1 2 3 4 3; 4 1 5 2 5 1 3 3 2 4; 3 5 6
%2 1 5 2 2 4 1]; Internetbeispiel - stimmt 

%Step 1: absteigende Ordnung der Summen der Bearbeitungszeiten der Jobs



% B ist die Summe Bearbeitungszeiten der Jobs über alle Maschinen
 B=sum(PI);
% Sortierung in absteigender Reihenfolge
[~,I]=sort(B,'descend');

% A2 sortierte A-Matrix
A2=PI(:,I);
A3=A2;
%PI;

% [m,n]=size(PI);
% 
% A2=PI; 
% A3=A2;

%Step 2: Berechnen Makespan der ersten beiden Jobs mit geänderter
%Reihenfolge

for d=1:2,
    for i=1:m,
        for j=1:2,

                % diese beiden if-Anw. beziehen sich nur auf die erste
                % Zeile und ersten Job, weil Zähler sonst kleiner 0 ist
                if j==1,
                    c(i,j)= sum (A2(1:i-1,1))+ A2(i,1);
                end             
                if j>=2 && i==1,    
                       c(i,j)=c(i,j-1)+A2(i,j);
                end
                
                
                if j>=2 && i~=1,
                    if c(i,j-1)> c(i-1,j),
                        c(i,j) = c(i,j-1) + A2(i,j);
                        else 
                        c(i,j) = c(i-1,j) + A2(i,j);
                    end    
                end
        end
    end
    
    % Makespan für die ersten beiden Reihenfolgen
    Makespan(d) = c(i,j);
    % Flippen der Jobs (für neue Reihenfolge)
    A2=fliplr(A2(:,1:j));
end

%Step 3: Reihenfolge mit niedrigerem Makespan wählen
if Makespan (1)< Makespan (2),
    A2=A2(:,[1 2 ]);
else
    A2=A2(:,[2 1 ]); %aus makespan-Perspektive egal, hat aber mehr idletime!
end

%Step 4: immer einen job dazuholen und weiter ab step 2

d = 1;

for l= 3:n,  

   A2=[A3(:,l), A2]; 
   
   A4=A2;

    for d= 1:l,
            
            if d == 1,
        
                A2=A2;

            elseif d <= l-1,
  
                A2 = [A2(:,1:d-2),fliplr(A2(:,d-1:d)),A2(:,d+1:end)];
    
            else
        
                A2 = [A2(:,1:l-2),fliplr(A2(:,l-1:l))];
    
            end
            
        for i=1:m,
                for j=1:l,
                    
                        if j==1,
                            c(i,j)= sum (A2(1:i-1,1))+ A2(i,1);
                        end
    
                        if j>=2 && i==1,    
                            c(i,j)=c(i,j-1)+A2(i,j);
                        end
                
                        if j>=2 && i~=1,
                            if c(i,j-1)> c(i-1,j),
                                c(i,j) = c(i,j-1) + A2(i,j);
                            else 
                                c(i,j) = c(i-1,j) + A2(i,j);
                            end    
                        end
                
        Makespan(d) = c(i,j);
    %A4=fliplr(A2(:,1:2))%flippen funktioniert nicht!
    %A2=circshift(A2,[0,1])
               end
        end
    end
    
    [T,d]=min(Makespan);
    
    A2 = A4;
    
    for z = 1:d,
    
        if z == 1,
        
                A2=A4;

        elseif z <= l-1,
  
                A2 = [A2(:,1:z-2),fliplr(A2(:,z-1:z)),A2(:,z+1:end)];
    
        else
        
                A2 = [A2(:,1:l-2),fliplr(A2(:,l-1:l))];
    
        end
    
    end
end

% % zur Ausgabe der optimale Reihenfolge
% for i = 1:n
%     for j= 1:n
% 
%       if A2(:,i) == PI(:,j)
%          
%         g(i,j) = j;
%         
%       else 
%         g(i,j) = 0;
%       end
%       
%     end
% end
% 
% %%%das hier ist die optimale Reihenfolge
% schedule = sum(g');
PI=A2;
% 
% %das hier ist der Makespan
% % MS = T;
