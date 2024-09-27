

function [StrainModel,SecRatioVec]=addSecBioRatio(StrainModel,allMets,allRxns,strainNames ,ratio)
%% add V_secrete/V_biomasss ratio 
[allSecMatrix_pFBA]=M2SMatrixPFBA(allMets,ratio); % only generate the secrete pFBA flux matrix 
matrixAll=allSecMatrix_pFBA.MT; % Temporary variable

SecRatioVec= zeros(length(allRxns), 4); % 

for n=1:4 
    
    Name=strainNames{n};      
    model=StrainModel.(Name); 

    for i=1:length(allRxns)
        temprxns=allRxns(i);
        tempmets=allMets(i);
        if matrixAll(i,n)>0           
            SecRatio=fastSecRatio(Name,tempmets,n,ratio);%  % or ratio=2 ;
            SecRatioVec(i,n)=SecRatio;
            [~, Idx1] = ismember(temprxns,model.rxns);
%             model.lb(Idx1)=0;
%             model.ub(Idx1)=100;    
            ConstraintName = ['RatioSec_',tempmets{:}];
            model = addMetabolite (model,ConstraintName);
            Idx_M=find(contains(model.mets,ConstraintName));
            Idx_R1=find(contains(model.rxns,'bio1'));
            Idx_R2=find(contains(model.rxns,temprxns));
            model.S(Idx_M,Idx_R1)=SecRatio;
            model.S(Idx_M,Idx_R2)=-1;
           
        end
        if matrixAll(i,n)<0 
            [~, Idx1] = ismember(temprxns,model.rxns);
            model.lb(Idx1)=-100;
            model.ub(Idx1)=0;              
            
            
            continue
        end
        
    end
   StrainModel.(Name)=model;
end
end

