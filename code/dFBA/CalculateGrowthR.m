function mu=CalculateGrowthR(StrainModel)

strainNames = {'A', 'P', 'S', 'V'};
for n=1:length(strainNames)    
Name=strainNames{n};     
% Update biomass vector
model=StrainModel.(Name);

sol=optimizeCbModel(model,'max','one');
    if isnan(sol.f)
        mu(n)=0   ;
    else
        mu(n) = sol.f;
    end
end
end
