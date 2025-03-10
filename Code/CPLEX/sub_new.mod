/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Andreas Hipp
 * Creation Date: 16.10.2020 at 15:56:27
 *********************************************/

 execute PARAMS {
  cplex.tilim = 1800;
 }
 
 //sets
 
 int jobs = ...;			//number of jobs
 int mach = ...;			//number of machines
 int stages = ...;			//number of stages
 
 range J = 1..jobs;
 range L = 1..jobs;			//position l of job j in schedule
 range I = 1..mach;
 range K = 1..stages;
 
 {int} m[K] = ...;			//machines per stage k
 
 //parameters
 
 //int psoa[K][J] = ...;		//soa instances
 int p[K][J] = ...;			//processing time of job j at stage k
 int machs[K] = ...;		//number of machines per stage
 
//execute {
 //cplex.setParam(IloCplex::p, p[1][J] = 2*psoa[1][J]);
 //cplex.setParam(IloCplex::p, p[2][J] = psoa[2][J]);
//}

//execute NEWP {
  //for (j in J, K,K==1) p[K][j] = 2.0 * p[K][j];
//}	
 
 //variables
 
 dvar float+ S[K][J];		//starting time of job j at stage k
 dvar float+ c[K][J];		//completion time of job j at stage k
 dvar float+ Sl[K][L];		//starting time of job in position l at stage k
 dvar float+ cl[K][L];		//completion time of job in position l at stage k
 
 //dvar float+ p[K][J];
 
 dvar boolean x[J][K][L];	//=1 if job in position l is scheduled at stage k
 dvar boolean y[L][K][I];	//=1 if job on position l is scheduled on machine i
 
 //objectives
 dvar float+ Cmax;
 //dvar float+ FT;
 
 //model
 
 minimize Cmax;
 //minimize FT;
 
 subject to {
   
 //forall (j in J, k in K: k == 1)
   //p[k][j] - 2 * psoa[k][j] <= 0;
   
 //forall (j in J, k in K: k == 2)
   //p[k][j] - psoa[k][j] <= 0;
   
 forall (k in K, l in J)
   //every job on exactly 1 position
   posdef1:
   sum(j in J) x[j][k][l] == 1;
   
 forall(j in J, k in K)
   //exactly one 1 job per position
   posdef2:
   sum(l in L) x[j][k][l] == 1;
   
 forall(l in J, k in K)
   //1 job at exactly 1 machine per stage
   posdef3:
   sum(mk in m[k]) y[l][k][mk] == 1;
   
 forall(j in J, k in K: k == 2)
   //Job can just start after finished at previous stage, part 1
   start1:
   S[k][j] <= S[k-1][j] + 2 * p[k-1][j];							//j oder l????
 
 forall(j in J, k in K: k == 2)
   //Job can just start after finished at previous stage, part 2
   start2:
   S[k][j] >= S[k-1][j] + 2 * p[k-1][j];
 
 forall(k in K:k == 1, l in J: l >= 2, t in J: t < l, i in I, mk in I)
   jobseq:
   (y[t][k][mk] == 1 && y[l][k][mk] == 1) =>
   Sl[k][l] >= Sl[k][t] + sum(j in J) (x[j][k][t] * (2 * p[k][j]));

 forall(k in K:k == 2, l in J: l >= 2, t in J: t < l, i in I, mk in I)
   jobseq1:
   (y[t][k][mk] == 1 && y[l][k][mk] == 1) =>
   Sl[k][l] >= Sl[k][t] + sum(j in J) (x[j][k][t] * p[k][j]);
  
 forall(j in J, k in K, l in J)
   //assignment of job j to position l - starting time 1
   jobID1:
   (x[j][k][l] == 1) => S[k][j] <= Sl[k][l];
 
 forall(j in J, k in K, l in J)
   //assignment of job j to position l - starting time 2
   jobID2:
   (x[j][k][l] == 1) => S[k][j] >= Sl[k][l];
   
 forall(k in K: k == 1, j in J)
   //completion time
   compl1:
   c[k][j] == S[k][j] + 2 * p[k][j];

 forall(k in K: k == 2, j in J)
   //completion time
   compl11:
   c[k][j] == S[k][j] + p[k][j];
  
 forall(k in K: k == 1, l in J)
   //completion time for job j in position l
   compl2:
   cl[k][l] == Sl[k][l] + sum(j in J)(x[j][k][l] * (2 * p[k][j]));
   
 forall(k in K: k == 2, l in J)
   //completion time for job j in position l
   compl21:
   cl[k][l] == Sl[k][l] + sum(j in J)(x[j][k][l] * p[k][j]);
   
   
   //makespan
   Cmax >= max(l in J) cl[stages][l];
   
 //FT == sum(j in J) c[stages][j];
 
 }

 //execute
 //{
  //writeln("FT= ",FT);
 //}

 execute
 {
   writeln("Cmax= ",Cmax);
 }