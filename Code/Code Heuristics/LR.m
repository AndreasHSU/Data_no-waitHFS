%function [FTmin,Smin] = LiuReeves(A)

%function[PI] = LR_RaueBenkel(p)
% (x,A)
% Heuristic by Liu/Reeves, EJOR 132 (2001) 439-452
% Input: processing times in matrix A and LR no. of solns x
%global p m n;
% Read processing time matrix

%A=[93	83	24	59	28	58	75;75	32	91	97	17	37	34;33	91	17	75	58	62	36;78	45	91	95	61	26	7;26	40	50	24	90	23	89];

%A=[1 2	3	12	28	5	25;75	10	41	47	17	22	34;1	21	17	15	58	32	2;18	45	31	2	61	26	7;26	2	50	24	20	23	1];
% p=A;
% PI =[
% 
%    144   154    42   180   194    58   126   196   172   136;
%     81    56    56    44    28    47    47     4    99    32];
% Determination of size of p

p=PI;
[m,n]=size(p);


%timestart=clock;

%0. Calculate matrix of weights w(i,k) (i.e. (4))
% Remark: k <--> k+1 since index 0 not here
% i = machine index, j = job index
%k wird zu k1, f zu f1, um Kollision der Parameter zu verhindern
w=zeros(m,n);
for i=1:1:m,
    for k1=1:1:n,
        % **** Achtung k-1 oder k, eher k-1
        w(i,k1)=m/(i+(k1-1)*(m-i)/(n-2));
    end
end
%
% Step 1, p. 442
% Calculate indices IT(j,0), AT(j,0) and f(j,0) (according to (3), (10),
% (11))
% k hier gleich 0, es ist also noch kein Job eingeplant


IT=zeros(1,n);
AT=IT;
cs=zeros(m,n);
f1=zeros(1,n);
rk=f1;
for j=1:1:n,
    IT(j)=0;
    cs(1,j)=p(1,j); %BZ der einzelnen Jobs 1.Maschine/Stufe
    t=zeros(m,1);
    cp=t;
    for i=1:1:m,
        t(i)=sum(p(i,:))-p(i,j);%Berechnen einer künstlichen Bearbeitungszeit aus dem Durchschnitt aller anderen Jobs außer j für M1 und M2
        t(i)=t(i)/(n-0-1);
    end
    % kann weg, s. o. cs(1,j)=p(1,j);
    cp(1)=cs(1,j)+t(1);
    for i=2:1:m,
        cs(i,j)=cs(i-1,j)+p(i,j); %BZ der einzelnen Jobs 2. Maschine/Stufe
        cp(i)=max(cp(i-1),cs(i,j))+t(i); %Completion Time 2. Maschine/Stufe mit künstlicher BZ 
        %'IT vor ',i,IT
        IT(j)=IT(j)+w(i,1)*cs(i-1,j);%IT des Jobs vor der 2. Maschine/Stufe
        %'IT nach ',i,IT,w(i,1),cs(i-1,j)
    end
    AT(j)=cs(m,j)+cp(m);% künstliche Flowtime, wenn p auf Job k folgt
    f1(j)=(n-0-2)*IT(j)+AT(j); %Indexfunktion
    %p
    %stop
end
%cs
%cp
%f
%IT
%AT
%'hier'
%stop
%f

%Dummy - Werte von f, rk - Jobs sortiert
[Dummy,rk]=sort(f1(:),'ascend');% rk=Sortierindex

%f
%AT
%IT

%  f, AT und IT werden nach rk sortiert 
f1=f1(rk);
AT=AT(rk);
IT=IT(rk);

%'hier'
%stop
% Break ties % wenn Jobs das gleiche Ergebnis haben werden sie wie folgt
% sortiert
impro=0;
while impro==0,
    impro=1;
    for j=2:1:n,
        if ( abs((f1(j)-f1(j-1)) / min(f1(j),f1(j-1)) ) <0.0001 ),
        %if f(j)==f(j-1),
            if IT(j)<IT(j-1),
                %'Ties 1 !!!'
                %stop
                h1=rk(j);
                rk(j)=rk(j-1);
                rk(j-1)=h1;
                h1=AT(j);
                AT(j)=AT(j-1);
                AT(j-1)=h1;
                h1=IT(j);
                IT(j)=IT(j-1);
                IT(j-1)=h1;
                h1=f1(j);
                f1(j)=f1(j-1);
                f1(j-1)=h1;
                impro=0;
            end
        end
    end
end

%'init seq R ',rk'
%stop
% ************** bis hier wohl ok ***************
% end of step 1, p.442
%
% Step 2 p. 442
%
% No. of sequences to be generated, first x jobs from rk (i.e. LR(x))
%'rk 1'
%rk'
%p
x=1;
FT=zeros(1,x);
FTmin=sum(sum(p))*n*m;
Smin=zeros(1,n);

% Main loop over initial (first) jobs (i.e. step 2, p. 442) *** Loop 1 ***
for xj=1:1:x,
    % Initialization *** 2 ***
    cs=zeros(m,n);
    S=zeros(1,n);
    
    % S sind die eingeplanten Jobs, hier dann der erste = Job 5 -
    % Zeilenvektor
    % U sind alle anderen Jobs - Spaltenvektor
    
    S(1)=rk(xj); %1. eingeplante Job ist der erste aus rk
    U=[rk(1:1:(xj-1)),rk((xj+1):1:n)];% alle noch nicht eingeplanten Jobs
    %'************ xj ***********'
    %'S, U 1'
    %S
    %U'
    
    % Usize ist die Anzahl der restlichen Jobs und h1 ist die Anzahl der
    % eingeplanten Jobs
    
    [Usize,h1]=size(U);
    
    %size(Usize)
    %stop
    
    cj=zeros(m,1);
    cp=cj;
    cs(1,1)=p(1,rk(xj)); %Completion Time 1. eingeplanter Job auf erster Maschine
    for ia=2:1:m,
        cs(ia,1)=cs(ia-1,1)+p(ia,rk(xj));% Completion Time 1. eingeplanter Job auf 2. Maschine
    end
    %'cs, S 1'
    %cs
    %S
    % *** Loop 3 ***
    %'Schleife über die anzuhängenden Jobs'
    for ja=2:1:(n-1),
    %'*************** ja *************'
     %   ja
        % *** Loop 4 ***
        IT=zeros(1,Usize(1,1));
        AT=IT; 
        f1=zeros(1,Usize(1,1));
        cu=zeros(m,Usize(1,1));
        %'Schleife über die unscheduled Jobs S U'
        %S
        %U'
%         if ja==5,
%             %abbruch;
%         end
        for jb=1:1:Usize(1,1),
      %'+++++++++++++++ jb +++++++++++++'
      %      'Job between S and remaining unscheduled jobs'
      %      U(jb)
            % for (S,U(rk(bj))) calculate IT(bj), t(p,j), AT(j), f(j)
            IT(jb)=0;
            % Candidate for next job is U(jb)
            %   potential sequence (S,U(jb),Unorkjb)
            cu(1,jb)=cs(1,ja-1)+p(1,U(jb));
            % all other jobs, i.e. not S and not U(jb)
            Unorkjb=vertcat(U(1:1:(jb-1)),U((jb+1):1:Usize));
            %'Sequence S, U(jb), Unorkjb'
            %S
            %U(jb)
            %Unorkjb'
            %h1=size(Unorkjb);
            t=zeros(m,1);
            t(1)=sum(p(1,Unorkjb))/(n-(ja-1)-1);
            for ic=2:1:m,
                % Calculation of IT
                %' vor ',ic,cu(ic,jb),cs(ic,ja-1),cu(ic-1,jb),p(ic,U(jb)),IT(jb),w(ic,ja),t(ic)
                cu(ic,jb)=max(cs(ic,ja-1),cu(ic-1,jb))+p(ic,U(jb));
                IT(jb)=IT(jb)+w(ic,ja)*max(cu(ic-1,jb)-cs(ic,ja-1),0);
                % Calculation of t(i,p)
                t(ic)=sum(p(ic,Unorkjb))/(n-(ja-1)-1);
                %' nach ',ic,cu(ic,jb),cs(ic,ja-1),cu(ic-1,jb),p(ic,U(jb)),IT(jb),w(ic,ja),t(ic)
            end
            %IT
            %cu
            %t
            % Calculation of (6) - (9), p. 442: Sequence (S,rk(jb),p)
            cj(1)=cs(1,ja-1)+p(1,U(jb));
            cp(1)=cj(1)+t(1);
            for id=2:1:m,
                cj(id)=max(cs(id,ja-1),cj(id-1))+p(id,U(jb));
                cp(id)=max(cj(id),cp(id-1))+t(id);
            end
            % Calculation of AT(jb) and f(jb), (10), (11)
            %cj
            %cp
            %n,ja
            %cj(m),cp(m)
            %U
            %t'
            AT(jb)=cj(m)+cp(m);
            f1(jb)=(n-(ja-1)-2)*IT(jb)+AT(jb);
            %AT
            %f
        end
        %'f, U, IT, AT 1'
        %f
        %U'
        %IT
        %AT
        %cs
        [Dummy,jsort]=sort(f1(1:1:Usize(1,1)),'ascend');
        %'jsort 1 ',jsort
        %stop
        f1=f1(jsort);
        %f
        %U'
        if ja==13,
            %abbruch;
        end
        U=U(jsort);
        IT=IT(jsort);
        AT=AT(jsort);
        %'f, U, IT, AT 2'
        %f
        %U'
        %IT
        %AT
        impro=0;
        while impro==0,
            impro=1;
            for j=2:1:Usize,
                if ( abs((f1(j)-f1(j-1)) / min(f1(j),f1(j-1)) ) <0.0001 ),
                %if f(j)==f(j-1),
                    if IT(j)<IT(j-1),
                        %'Ties 2 !!!'
                        %stop
                        h1=U(j);
                        U(j)=U(j-1);
                        U(j-1)=h1;
                        h1=AT(j);
                        AT(j)=AT(j-1);
                        AT(j-1)=h1;
                        h1=IT(j);
                        IT(j)=IT(j-1);
                        IT(j-1)=h1;
                        h1=f1(j);
                        f1(j)=f1(j-1);
                        f1(j-1)=h1;
                        impro=0;
                    end
                end
            end
        end
        f1;
        IT;
        AT;
        U';
        S;
%         if ja==30,
%             abbruch
%         end
        % Identify job jopt to be appended
        %U'
        %stop
        jopt=U(1);
        %jopt
        S(ja)=jopt;
        %S
        %stop
        U=U(2:1:Usize(1,1));
        [Usize,h1]=size(U);
        % Update of cs
        cs(1,ja)=cs(1,ja-1)+p(1,jopt);
        for ie=2:1:m,
            cs(ie,ja)=max(cs(ie-1,ja),cs(ie,ja-1))+p(ie,jopt);
        end
       % 'S, U, cs, p after 1'
       % S
       % U'
       % cs
       % p(:,S(1:1:ja))
        %'Ende Schleife S, U'
        %S
        %U
    end
    S(n)=U(1);
    % Calculate flowtime for S
    cs(1,n)=cs(1,n-1)+p(1,S(n));
    for ig=2:1:m,
        cs(ig,n)=max(cs(ig-1,n),cs(ig,n-1))+p(ig,S(n));
    end
    C=cs;
    FT(xj)=sum(C(m,:));
    if FT(xj)<FTmin,
        FTmin=FT(xj);
        Smin=S;
    else
    end
end
        %'Ganz am Ende S'
        %S
% Best solution
%FT
Smin;
FTmin;
PI=p(:,Smin);



%stop