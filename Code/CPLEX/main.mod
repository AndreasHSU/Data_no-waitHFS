/*********************************************
 * OPL 12.10.0.0 Model
 * Author: Andreas Hipp
 * Creation Date: 16.10.2020 at 15:56:11
 *********************************************/

 
 {string} datFiles=...;

	main {
      var source = new IloOplModelSource("sub_new_warmstart.mod");
      var cplex = new IloCplex();
      var def = new IloOplModelDefinition(source);

      for(var datFile in thisOplModel.datFiles)
      {
      var opl = new IloOplModel(def,cplex);

      var data2= new IloOplDataSource(datFile);

      opl.addDataSource(data2);
      opl.generate();

 //     if (cplex.solve()) {  
 //        opl.postProcess();
 //        var o=new IloOplOutputFile("Res_FT_warmstart_"+datFile+".txt");
 //        o.writeln(cplex.getObjValue());
 //        o.close();
 //        writeln(cplex.getObjValue());
 //     } else {
 //        writeln("No solution");
 //     }
      
      if (cplex.solve()) {  
         opl.postProcess();
         var o=new IloOplOutputFile("Res_Cmax_warmstart_"+datFile+".txt");
         o.writeln(cplex.getObjValue());
         o.close();
         writeln(cplex.getObjValue());
      } else {
         writeln("No solution");
	     }
      
     opl.end();
    }  

    }