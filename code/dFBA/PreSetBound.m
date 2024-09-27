
function StrainModel=PreSetBound(StrainModel,strainNames,InorgRxns,allSimuRxns)

for n=1:4
    Name=strainNames{n};      
    model=StrainModel.(Name);  
    excInd = findExcRxns(model,false);
    excRxn = model.rxns(excInd);
    excRxnNames=excRxn(contains(excRxn, '_e')); 
    EX_Rxn.(Name)=excRxn(contains(excRxn, '_e')); 
    
    model.lb(contains(model.rxns,EX_Rxn.(Name)))=0;% only Secrete
    model.ub(contains(model.rxns,EX_Rxn.(Name)))=0;% only Secrete
    
    model.lb(contains(model.rxns,InorgRxns))=-100;%  unlimit: O2, H+,H4PO3,Pi,H2O and mineral salt
    model.ub(contains(model.rxns,InorgRxns))=100;%  unlimit: O2, H+,H4PO3,Pi,H2O and mineral salt

    model.lb(contains(model.rxns,allSimuRxns))=-100;%  unlimit: O2, H+,H4PO3,Pi,H2O and mineral salt
    model.ub(contains(model.rxns,allSimuRxns))=100;%  unlimit: O2, H+,H4PO3,Pi,H2O and mineral salt
    
    model = changeRxnBounds(model,'EX_cpd00007_e',-100,'l');%O2
    model = changeRxnBounds(model,'EX_cpd00007_e',0,'u');%O2

    model = changeRxnBounds(model,'EX_cpd00011_e',0,'l');%CO2
    model = changeRxnBounds(model,'EX_cpd00011_e',100,'u');%CO2

    model = changeRxnBounds(model,'EX_cpd00027_e',0,'l');% EX_D_Glucose
    model = changeRxnBounds(model,'EX_cpd00027_e',0,'u');% EX_D_Glucose
    
    model = changeRxnBounds(model,'EX_cpd00013_e',-100,'l');% NH4
    model = changeRxnBounds(model,'EX_cpd00013_e',100,'u');% NH4
    
    model = changeRxnBounds(model,'bio1',0,'l');
    model = changeRxnBounds(model,'bio1',100,'u');
    StrainModel.(Name)=model;
end
% PreSet_mu=CalculateGrowthR(StrainModel)
end
% 
% 
% 



