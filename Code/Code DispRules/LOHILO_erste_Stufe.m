%wie 407_leisten LO/HILO Sortierung max-min aber mit kleinen Unterschieden
%zuerst

[~,n]=size(PI);
 
if n==15,
    HIHILO_erste_Stufe
else
    HILOHI_erste_Stufe
end
 
PI= PI(:,end:-1:1);


