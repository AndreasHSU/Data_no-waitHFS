%function LGILGOM


% Aorig=[34 45 4 18 22 16 7]; %Bearbeitungszeit auf erster Maschine
% Borig=[31 19 3 40 26 15 1]; %Bearbeitungszeit auf zweiter Maschine

% PI=[196   194   136   180    58   126   154    42   144   172;
% 4    28    32    44    47    47    56    56    81    99];

[~,n]=size(PI);

% n=7;

Aorig=PI(1,:);
Borig=PI(2,:);

A=[0,Aorig]';
B=[0,Borig]';
C=A;
D=B;
n1=n+1;

% v1 Output-Komponente in Diss GILGOM

Origin=zeros(1,n1)';
Phi=zeros(1,n1)';
v1=zeros(1,n1)';
Cphi=zeros(1,n)';
Popt=zeros(1,n1)';

Origin(1)=n1;
Origin(2:1:n1)=1:1:n;

Phi(1:1:n1)=1:1:n1;

%CALL SSORT1(D,C,Origin,1,N1,1)
[~,IndD]= sort (D,'ascend');     %~ für ungenutzte Werte
D=D(IndD,:);
C=C(IndD,:);
Origin=Origin(IndD,:);

%CALL SSORT2(C,Phi,1,N1,1)
[~,IndC]= sort (C,'ascend');     %~ für ungenutzte Werte
Phi=Phi(IndC,:);

%CALL CRCOMP(D,C,Phi,N1,Cphi)
for i=1:1:n;
    h1=min(D(i+1),C(Phi(i+1)));
    h2=max(D(i),C(Phi(i)));
    Cphi(i)=max(0,(h1-h2));
end

%CALL GRAPH(Phi,Cphi,N1,C,D,Popt)
I1ind=99999*ones(1,n1)';
I2ind=99999*ones(1,n1)';
Help1=99999*ones(1,n1)';
Help2=99999*ones(1,n1)';

Kompza=0;
% 100
Kompnr=zeros(1,n1)';
% 200
for i=1:n1,
    if Kompnr(i)==0,
        Kompza=Kompza+1;
        Kompnr(i)=Kompza;
        pi=Phi(i);
        i1=1;
        while i1<=n1,
            if (pi~=i),
                Kompnr(pi)=Kompza;
                pi=Phi(pi);
                i1=i1+1;
            else
                i1=n1+1;                
            end
        end
    end
end

% 250 - 1000
gr1ind=0;
gr2ind=0;
while Kompza~=1,
    cphimi=999999999;
    for i=1:n,
        if (and((Cphi(i)<cphimi),(Kompnr(i)~=Kompnr(i+1)))),
            cphimi=Cphi(i);
            imin=i;
            kompok=Kompnr(i);
            kompno=Kompnr(i+1);
        end
    end
    for i=1:n1
        if (Kompnr(i)==kompno),
            Kompnr(i)=kompok;
        end
    end
 % 500
    Kompza=Kompza-1;
    if (C(Phi(imin))>=D(imin)),
        gr1ind=gr1ind+1;
        I1ind(gr1ind)=imin; 
    else
        gr2ind=gr2ind+1;
        I2ind(gr2ind)=imin;
    end
end

% 1000 CONTINUE

help1(1:n)=1:n;
help2(1:n)=1:n;
    
%CALL SSORT(I1ind,help1,1,gr1ind,-1) und für 2

[~,Indi1]= sort (I1ind(1:gr1ind),'descend');     %~ für ungenutzte Werte
I1ind(1:gr1ind)=I1ind(Indi1);
help1(1:gr1ind)=help1(Indi1);

[~,Indi2]= sort (I2ind(1:gr2ind),'ascend');     %~ für ungenutzte Werte
I2ind(1:gr2ind)=I2ind(Indi2);
help2(1:gr2ind)=help2(Indi2);

% 2000 CONTINUE, jetzt T4

if (gr1ind~=0),
    for i=1:gr1ind,
        h=Phi(I1ind(i));
        Phi(I1ind(i))=Phi(I1ind(i)+1);
        Phi(I1ind(i)+1)=h;
    end
end
if (gr2ind~=0),
    for i=1:gr2ind,
        h=Phi(I2ind(i));
        Phi(I2ind(i))=Phi(I2ind(i)+1);
        Phi(I2ind(i)+1)=h;
    end
end
% 2250
Popt(1)=1;
for i=2:n1,
    Popt(i)=Phi(Popt(i-1));
end

% back in GILGOM
for i=1:n1,
    v1(i)=Origin(Popt(i));
end
% back in MAIN
v(1:n)=v1(2:n1);
% v is optimum sequence

PI=PI(:,v);
