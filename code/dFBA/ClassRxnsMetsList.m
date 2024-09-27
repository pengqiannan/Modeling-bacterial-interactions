

%% Organize reactions and metabolites

% % % Lignin degradation metabolites  flux<0
LigninA= {'cpd00401','cpd00153','cpd00136','cpd01059','cpd01733'};
LigninP= {'cpd00197','cpd00077','cpd00153','cpd04073','cpd00561','cpd00489','cpd00136','cpd01059','cpd01733'};
LigninS= {'cpd00136','cpd01059','cpd01733'};
LigninV= {'cpd00197','cpd00401','cpd00153','cpd00604','cpd00136','cpd01059','cpd01733'};
% % % Cross-feeding metabolites  flux>0 
ExMetsA= {'cpd00035','cpd00041','cpd00036','cpd00054'};
ExMetsP= {'cpd00036','cpd00054','cpd00130','cpd00938'}; 
ExMetsS= {'cpd00100','cpd00035','cpd00106','cpd00130'};
ExMetsV= {'cpd00856','cpd02255','cpd00041','cpd00106','cpd00100'}; 

NsourcesMets = {'cpd00013'};
NsourcesRxns=strcat('EX_', NsourcesMets,'_e');

allSimuMets = sort(unique ([ExMetsA, ExMetsP, ExMetsV, ExMetsS,LigninA,LigninP,LigninS,LigninV,NsourcesMets]))';
allSimuRxns=strcat('EX_', allSimuMets,'_e');

allRxns=allSimuRxns;
allMets=allSimuMets;

allSecMets =sort(unique ([ExMetsA, ExMetsP, ExMetsV, ExMetsS]));
allSecMetsRxns=strcat('EX_', allSecMets,'_e');
[~, IndexSecMets] = ismember(allSecMets,allMets);% counts:10


allLigMets = sort(unique ([LigninA,LigninP,LigninS,LigninV]));
allLigMetsRxns=strcat('EX_', allLigMets,'_e');
[~, IndexLigMets] = ismember(allLigMets,allMets);% counts:12

load('InorgMets.mat');
InorgRxns=strcat('EX_', InorgMets,'_e');



% 
% PreSet_mu=CalculateGrowthR(StrainModel)
% 



