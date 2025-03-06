% m=3;
% n=3;
% 
% %Ausgabe der Summen in D
% B=sum(A);
% D=[A;B];
% [H,I]=sort(D(m+1,:), 'descend'); 
% D=D(:,I)
% 
% %ohne Ausgabe der Summen in D
% B=sum(A);
% [H,I]=sort(B,'descend'); 
% D=A(:,I);

B= PI(1,:);
[~,I]=sort(B, 'descend'); 
PI=PI(:,I);