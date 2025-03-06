
[~,n]=size(PI);
 
if n==15,
    HIHILO_absolute_Differenz_gesamt
else
    HILOHI_absolute_Differenz_gesamt
end
 
PI= PI(:,end:-1:1);