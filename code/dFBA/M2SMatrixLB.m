%% Construct the uptake rxns * strians Matrix 
function  [US_Matrix]=M2SMatrixLB(StrainModel,allMets)
strainNames = {'A', 'P', 'S', 'V'};
prefixes = {'A_', 'P_', 'S_', 'V_'};
allFBALB=[];
allFBARxns={};

    for x=1:4
    Name=strainNames{x};     
    model=StrainModel.(Name);
    ModelsUpRxns = strcat(prefixes{x}, model.rxns);
    allFBARxns=[allFBARxns;ModelsUpRxns];
    LB=model.lb;
    allFBALB=[allFBALB;LB];
    end
% flux<0

US_Matrix = zeros(length(allMets), 4); % 

allMetsRxnsInA= strcat('A_EX_',allMets,'_e');
[uptIndexA1, uptIndexA2] = ismember(allMetsRxnsInA,allFBARxns);
uptIndexA2 = uptIndexA2(uptIndexA2 > 0);
US_Matrix((uptIndexA1==1),1)=allFBALB(uptIndexA2);

allMetsRxnsInP= strcat('P_EX_',allMets,'_e');
[uptIndexP1, uptIndexP2] = ismember(allMetsRxnsInP,allFBARxns);
uptIndexP2 = uptIndexP2(uptIndexP2 > 0);
US_Matrix((uptIndexP1==1),2)=allFBALB(uptIndexP2);

allMetsRxnsInS= strcat('S_EX_',allMets,'_e');
[uptIndexS1, uptIndexS2] = ismember(allMetsRxnsInS,allFBARxns);
uptIndexS2 = uptIndexS2(uptIndexS2 > 0);
US_Matrix((uptIndexS1==1),3)=allFBALB(uptIndexS2);

allMetsRxnsInV= strcat('V_EX_',allMets,'_e');
[uptIndexV1, uptIndexV2] = ismember(allMetsRxnsInV,allFBARxns);
uptIndexV2 = uptIndexV2(uptIndexV2 > 0);
US_Matrix((uptIndexV1==1),4)=allFBALB(uptIndexV2);

% allLBMatrix.MT=US_Matrix;
% allLBMatrix.MN=allMets;
% allLBMatrix.SN=strainNames;

end




