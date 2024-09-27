
function [SecRatio ,pFBAbio]=fastSecRatio(Name,tempmets,n,ratio)
currentDir = pwd;
if ratio == 1
    load(strcat(currentDir, filesep, 'pFBA01.mat'));
elseif ratio == 2
    load(strcat(currentDir, filesep, 'pFBA100.mat'));
else
    error('Invalid ratio value. Please input 1 or 2.');
end


allPFBARxns=pFBA.rxns;
allPFBAFluxs=pFBA.flux;


bioRxnsList=sort(allPFBARxns(contains(allPFBARxns, '_bio1')));% A P S V
[~, BioRxnsIdx] = ismember(bioRxnsList,allPFBARxns);
SecRxn=strcat(Name,'_SEC_', tempmets,'_u');     % Note : combine model reactions name

[~, IndSecRxn] = ismember(SecRxn,allPFBARxns);  % Note : find combine model reactions name
    % Record the results for easy subsequent verification
% % %     SecRxnNAME(end+1)={SecRxn};
% % %     SecRxnIdx(end+1)={num2str(IndSecRxn)};  
pFBAbio=allPFBAFluxs(BioRxnsIdx);
    % Calculate the secrete recation  ratio 
% SecRatio=abs(allPFBAFluxs(IndSecRxn))/allPFBAFluxs(BioRxnsIdx(n));% Note : allFluxs=pFBA flux  !!!!!    
SecRatio=(allPFBAFluxs(IndSecRxn))/allPFBAFluxs(BioRxnsIdx(n));% Note : allFluxs=pFBA flux  !!!!! 
end




