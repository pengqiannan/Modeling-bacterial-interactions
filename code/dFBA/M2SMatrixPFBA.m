%% Construct the uptake rxns * strians Matrix 
function  [allExMetsMatrix]=M2SMatrixPFBA(allMets,ratio)
currentDir = pwd;
if ratio == 1
    load(strcat(currentDir, filesep, 'pFBA01.mat'));% Ratio : P:S:V:A=1:1:1:1
elseif ratio == 2
    load(strcat(currentDir, filesep, 'pFBA100.mat'));% Ratio : P:S:V:A=100:1:1:1
else
    error('Invalid ratio value. Please input 1 or 2.');
end


allRxns=pFBA.rxns;
allFluxs=pFBA.flux;
strainNames = {'A', 'P', 'S', 'V'};
% flux<0


US_Matrix = zeros(length(allMets), 4); % 
allMetsRxnsInA= strcat('A_SEC_',allMets,'_u');
[uptIndexA1, uptIndexA2] = ismember(allMetsRxnsInA,allRxns);
uptIndexA2 = uptIndexA2(uptIndexA2 > 0);
US_Matrix((uptIndexA1==1),1)=allFluxs(uptIndexA2);

allMetsRxnsInP= strcat('P_SEC_',allMets,'_u');
[uptIndexP1, uptIndexP2] = ismember(allMetsRxnsInP,allRxns);
uptIndexP2 = uptIndexP2(uptIndexP2 > 0);
US_Matrix((uptIndexP1==1),2)=allFluxs(uptIndexP2);

allMetsRxnsInS= strcat('S_SEC_',allMets,'_u');
[uptIndexS1, uptIndexS2] = ismember(allMetsRxnsInS,allRxns);
uptIndexS2 = uptIndexS2(uptIndexS2 > 0);
US_Matrix((uptIndexS1==1),3)=allFluxs(uptIndexS2);

allMetsRxnsInV= strcat('V_SEC_',allMets,'_u');
[uptIndexV1, uptIndexV2] = ismember(allMetsRxnsInV,allRxns);
uptIndexV2 = uptIndexV2(uptIndexV2 > 0);
US_Matrix((uptIndexV1==1),4)=allFluxs(uptIndexV2);

allExMetsMatrix.MT=US_Matrix;
allExMetsMatrix.MN=allMets;
allExMetsMatrix.SN=strainNames;
end




