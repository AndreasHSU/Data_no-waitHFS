%wie 407_Leisten LO/LOHI --> kleine Unterschiede zuerst


[~,n]=size(PI);
 
if n==15,
    HILOHI_absolute_Differenz_gesamt
else
    HIHILO_absolute_Differenz_gesamt
end
 
PI= PI(:,end:-1:1);