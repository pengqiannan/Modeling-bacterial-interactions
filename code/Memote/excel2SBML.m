clear
%%%%%%% P. gergoviae L1
%% load model
model = readCbModel('P. gergoviae L1.xls');
% rxns list
rxn_list = readtable('P. gergoviae L1.xls');
% Metabolite List
met_list = readtable('P. gergoviae L1.xls','Sheet','Metabolite List');
%% model.metHMDBID:Secondary Accession Numbers : HMDB00902(https://hmdb.ca/metabolites/HMDB0000902)
for t =1:length(model.metHMDBID)
    metHMDBID = model.metHMDBID{t,1}
    if isempty(metHMDBID)
    model.metHMDBID{t,1} = metHMDBID
    else
    metHMDBID(5:6) = [];
    model.metHMDBID{t,1} = metHMDBID
    end
end
%% add model.metBIGGID
model.metBiGGID = table2cell(met_list(:,7));
model.metBiGGID = regexprep(model.metBiGGID, '^BiGG: ', '', 'once');
%% add model.metSEEDID
model.metSEEDID = table2cell(met_list(:,8));
%% MetaNetX(MNX) Chemical
%% add model.metMetaNetXID
model.metMetaNetXID = table2cell(met_list(:,9));
%% inchikey
%% add model.metInChIString
model.metInchikey=table2cell(met_list(:,10));
%% inchi
%% add model.metInChIString
model.metInChIString=table2cell(met_list(:,11));
%% change metChEBIID:  CHEBI:XXX
model.metChEBIID = table2cell(met_list(:,12));
model.metChEBIID = strcat('CHEBI: ',model.metChEBIID);
%% add model.metBioCycID
model.metBioCycID = table2cell(met_list(:,15));
%%%%%%%%
%% add rxnKEGGID
model.rxnKEGGID= table2cell(rxn_list(:,10));
%% add rxnseedID
model.rxnSEEDID=table2cell(rxn_list(:,11));
%% add rxnRheaID
rxnRheaID = table2cell(rxn_list(:,12));
rxnRheaID_t = cellfun(@num2str, rxnRheaID, 'UniformOutput', false);
for t1 =1:length(rxnRheaID)
    if ismember(rxnRheaID_t(t1,1),'NaN')
        model.rxnRheaID(t1,1) = {''};
    else
        model.rxnRheaID(t1,1) = rxnRheaID_t(t1,1);
    end
end  
%% add MetaNETID
model.rxnMetaNetXID= table2cell(rxn_list(:,13));
%% add rxnBiggID
model.rxnBiGGID=table2cell(rxn_list(:,14));
%% add rxnBioCycID
model.rxnBioCycID= table2cell(rxn_list(:,15));
%% add SBO Terms
model.metSBOTerms = repmat({'SBO:0000247'}, length(model.mets), 1);  
model.rxnSBOTerms = repmat({'SBO:0000176'}, length(model.rxns), 1); 
r = find(model.c);% Biomass
model.rxnSBOTerms(r,1) = {'SBO:0000629'}; 
%%
model.comps = {'c'; 'e';};  
model.compNames = {'cytosol' ; 'extracellular';};
% add model.mets
for i = 1:length(model.mets)
    if endsWith(model.mets{i}, '[c0]')
        model.metComps(i,1) = find(strcmp(model.comps, 'c'));
    elseif endsWith(model.mets{i}, '[e0]')
        model.metComps(i,1) = find(strcmp(model.comps, 'e'));
    else
        warning('Metabolite %s does not match any known compartments.', model.mets{i});
    end
end
sbmlModel = writeSBML(model, 'P.gergoviae');
% outmodel = writeCbModel(model, 'format','mat');


clear
%%%%%%% V. alginolyticus 45
%% load model
model = readCbModel('V. alginolyticus 45.xls');
% rxns list
rxn_list = readtable('V. alginolyticus 45.xls');
% Metabolite List
met_list = readtable('V. alginolyticus 45.xls','Sheet','Metabolite List');
%% model.metHMDBID:Secondary Accession Numbers : HMDB00902(https://hmdb.ca/metabolites/HMDB0000902)
for t =1:length(model.metHMDBID)
    metHMDBID = model.metHMDBID{t,1}
    if isempty(metHMDBID)
    model.metHMDBID{t,1} = metHMDBID
    else
    metHMDBID(5:6) = [];
    model.metHMDBID{t,1} = metHMDBID
    end
end
%% add model.metBIGGID
model.metBiGGID = table2cell(met_list(:,7));
model.metBiGGID = regexprep(model.metBiGGID, '^BiGG: ', '', 'once');
%% add model.metSEEDID
model.metSEEDID = table2cell(met_list(:,8));
%% MetaNetX(MNX) Chemical
%% add model.metMetaNetXID
model.metMetaNetXID = table2cell(met_list(:,9));
%% inchikey
%% add model.metInChIString
model.metInchikey=table2cell(met_list(:,10));
%% inchi
%% add model.metInChIString
model.metInChIString=table2cell(met_list(:,11));
%% change metChEBIID:  CHEBI:XXX
model.metChEBIID = table2cell(met_list(:,12));
model.metChEBIID = strcat('CHEBI: ',model.metChEBIID);
%% add model.metBioCycID
model.metBioCycID = table2cell(met_list(:,15));
%%%%%%%%
%% add rxnKEGGID
model.rxnKEGGID= table2cell(rxn_list(:,10));
%% add rxnseedID
model.rxnSEEDID=table2cell(rxn_list(:,11));
%% add rxnRheaID
rxnRheaID = table2cell(rxn_list(:,12));
rxnRheaID_t = cellfun(@num2str, rxnRheaID, 'UniformOutput', false);
for t1 =1:length(rxnRheaID)
    if ismember(rxnRheaID_t(t1,1),'NaN')
        model.rxnRheaID(t1,1) = {''};
    else
        model.rxnRheaID(t1,1) = rxnRheaID_t(t1,1);
    end
end
%% add MetaNETID
model.rxnMetaNetXID= table2cell(rxn_list(:,13));
%% add rxnBiggID
model.rxnBiGGID=table2cell(rxn_list(:,14));
%% add rxnBioCycID
model.rxnBioCycID= table2cell(rxn_list(:,15));
%% add SBO Terms
model.metSBOTerms = repmat({'SBO:0000247'}, length(model.mets), 1);  
model.rxnSBOTerms = repmat({'SBO:0000176'}, length(model.rxns), 1); 
r = find(model.c);% Biomass
model.rxnSBOTerms(r,1) = {'SBO:0000629'}; 
%%
model.comps = {'c';'e';};  
model.compNames = {'cytosol' ;'extracellular';};
% add model.mets
for i = 1:length(model.mets)
    if endsWith(model.mets{i}, '[c0]')
        model.metComps(i,1) = find(strcmp(model.comps, 'c'));
    elseif endsWith(model.mets{i}, '[e0]')
        model.metComps(i,1) = find(strcmp(model.comps, 'e'));
    else
        warning('Metabolite %s does not match any known compartments.', model.mets{i});
    end
end
sbmlModel = writeSBML(model, 'V.alginolyticus');


clear
%%%%%%% P. gergoviae L1
%% load model
model = readCbModel('A. hydrophila 07.xls');
% rxns list
rxn_list = readtable('A. hydrophila 07.xls');
% Metabolite List
met_list = readtable('A. hydrophila 07.xls','Sheet','Metabolite List');
%% model.metHMDBID:Secondary Accession Numbers : HMDB00902(https://hmdb.ca/metabolites/HMDB0000902)
for t =1:length(model.metHMDBID)
    metHMDBID = model.metHMDBID{t,1}
    if isempty(metHMDBID)
    model.metHMDBID{t,1} = metHMDBID
    else
    metHMDBID(5:6) = [];
    model.metHMDBID{t,1} = metHMDBID
    end
end
%% add model.metBIGGID
model.metBiGGID = table2cell(met_list(:,7));
model.metBiGGID = regexprep(model.metBiGGID, '^BiGG: ', '', 'once');
%% add model.metSEEDID
model.metSEEDID = table2cell(met_list(:,8));
%% MetaNetX(MNX) Chemical
%% add model.metMetaNetXID
model.metMetaNetXID = table2cell(met_list(:,9));
%% inchikey
%% add model.metInChIString
model.metInchikey=table2cell(met_list(:,10));
%% inchi
%% add model.metInChIString
model.metInChIString=table2cell(met_list(:,11));
%% change metChEBIID:  CHEBI:XXX
model.metChEBIID = table2cell(met_list(:,12));
model.metChEBIID = strcat('CHEBI: ',model.metChEBIID);
%% add model.metBioCycID
model.metBioCycID = table2cell(met_list(:,15));
%%%%%%%%
%% add rxnKEGGID
model.rxnKEGGID= table2cell(rxn_list(:,10));
%% add rxnseedID
model.rxnSEEDID=table2cell(rxn_list(:,11));
%% add rxnRheaID
rxnRheaID = table2cell(rxn_list(:,12));
rxnRheaID_t = cellfun(@num2str, rxnRheaID, 'UniformOutput', false);
for t1 =1:length(rxnRheaID)
    if ismember(rxnRheaID_t(t1,1),'NaN')
        model.rxnRheaID(t1,1) = {''};
    else
        model.rxnRheaID(t1,1) = rxnRheaID_t(t1,1);
    end
end  
%% add MetaNETID
model.rxnMetaNetXID= table2cell(rxn_list(:,13));
%% add rxnBiggID
model.rxnBiGGID=table2cell(rxn_list(:,14));
%% add rxnBioCycID
model.rxnBioCycID= table2cell(rxn_list(:,15));
%% add SBO Terms
model.metSBOTerms = repmat({'SBO:0000247'}, length(model.mets), 1);  
model.rxnSBOTerms = repmat({'SBO:0000176'}, length(model.rxns), 1); 
r = find(model.c);% Biomass
model.rxnSBOTerms(r,1) = {'SBO:0000629'}; 
%%
model.comps = {'c'; 'e';};  
model.compNames = {'cytosol' ; 'extracellular';};
% add model.mets
for i = 1:length(model.mets)
    if endsWith(model.mets{i}, '[c0]')
        model.metComps(i,1) = find(strcmp(model.comps, 'c'));
    elseif endsWith(model.mets{i}, '[e0]')
        model.metComps(i,1) = find(strcmp(model.comps, 'e'));
    else
        warning('Metabolite %s does not match any known compartments.', model.mets{i});
    end
end
sbmlModel = writeSBML(model, 'A.hydrophila');
% outmodel = writeCbModel(model, 'format','mat');


clear
%%%%%%% S. putrefaciens 63
%% load model
model = readCbModel('S. putrefaciens 63.xls');
% rxns list
rxn_list = readtable('S. putrefaciens 63.xls');
% Metabolite List
met_list = readtable('S. putrefaciens 63.xls','Sheet','Metabolite List');
%% model.metHMDBID:Secondary Accession Numbers : HMDB00902(https://hmdb.ca/metabolites/HMDB0000902)
for t =1:length(model.metHMDBID)
    metHMDBID = model.metHMDBID{t,1}
    if isempty(metHMDBID)
    model.metHMDBID{t,1} = metHMDBID
    else
    metHMDBID(5:6) = [];
    model.metHMDBID{t,1} = metHMDBID
    end
end
%% add model.metBIGGID
model.metBiGGID = table2cell(met_list(:,7));
model.metBiGGID = regexprep(model.metBiGGID, '^BiGG: ', '', 'once');
%% add model.metSEEDID
model.metSEEDID = table2cell(met_list(:,8));
%% MetaNetX(MNX) Chemical
%% add model.metMetaNetXID
model.metMetaNetXID = table2cell(met_list(:,9));
%% inchikey
%% add model.metInChIString
model.metInchikey=table2cell(met_list(:,10));
%% inchi
%% add model.metInChIString
model.metInChIString=table2cell(met_list(:,11));
%% change metChEBIID:  CHEBI:XXX
model.metChEBIID = table2cell(met_list(:,12));
model.metChEBIID = strcat('CHEBI: ',model.metChEBIID);
%% add model.metBioCycID
model.metBioCycID = table2cell(met_list(:,15));
%%%%%%%%
%% add rxnKEGGID
model.rxnKEGGID= table2cell(rxn_list(:,10));
%% add rxnseedID
model.rxnSEEDID=table2cell(rxn_list(:,11));
%% add rxnRheaID
rxnRheaID = table2cell(rxn_list(:,12));
rxnRheaID_t = cellfun(@num2str, rxnRheaID, 'UniformOutput', false);
for t1 =1:length(rxnRheaID)
    if ismember(rxnRheaID_t(t1,1),'NaN')
        model.rxnRheaID(t1,1) = {''};
    else
        model.rxnRheaID(t1,1) = rxnRheaID_t(t1,1);
    end
end
%% add MetaNETID
model.rxnMetaNetXID= table2cell(rxn_list(:,13));
%% add rxnBiggID
model.rxnBiGGID=table2cell(rxn_list(:,14));
%% add rxnBioCycID
model.rxnBioCycID= table2cell(rxn_list(:,15));
%% add SBO Terms
model.metSBOTerms = repmat({'SBO:0000247'}, length(model.mets), 1);  
model.rxnSBOTerms = repmat({'SBO:0000176'}, length(model.rxns), 1); 
r = find(model.c);% Biomass
model.rxnSBOTerms(r,1) = {'SBO:0000629'}; 
%%
model.comps = {'c' ;'e';}; 
model.compNames = {'cytosol' ; 'extracellular';};
% add model.mets
for i = 1:length(model.mets)
    if endsWith(model.mets{i}, '[c0]')
        model.metComps(i,1) = find(strcmp(model.comps, 'c'));
    elseif endsWith(model.mets{i}, '[e0]')
        model.metComps(i,1) = find(strcmp(model.comps, 'e'));
    else
        warning('Metabolite %s does not match any known compartments.', model.mets{i});
    end
end
sbmlModel = writeSBML(model, 'S.putrefaciens');
% outmodel = writeCbModel(model, 'format','mat');


