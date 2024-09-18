function c = table2cell(t,varargin)  %#codegen
%TABLE2CELL Convert table to cell array.
%   C = TABLE2CELL(T) converts the table T to a cell array C.  Each variable in
%   T becomes one column of cells in C.  If T is an M-by-N table, then C is
%   M-by-N.
%
%   See also CELL2TABLE, TABLE2ARRAY, TABLE2STRUCT, TABLE.

%   Copyright 2012-2019 The MathWorks, Inc.

if ~isempty(coder.target)
    % codegen, redirect to codegen specific function and return
    c = matlab.internal.coder.table2cell(t, varargin{:});
    return
end

if ~isa(t,'tabular')
    error(message('MATLAB:table2cell:NonTable'))
end

% Each variable in D becomes a single column in C.
[nrows,nvars] = size(t);
c = cell(nrows,nvars);

t_vars = getVars(t,false);
for j = 1:nvars
    vj = t_vars{j};
    if iscell(vj)
        if iscolumn(vj)
            % If the cell var is a single column, copy it into D as is.
            c(:,j) = vj;
        else
            % If the cell var is multi-column, break it apart by rows, but keep
            % each row intact.
            c(:,j) = mat2cell(vj,ones(nrows,1));
        end
    else
        % If the variable is not a cell array, split it up into cells, one per row.
        c(:,j) = mat2cell(vj,ones(nrows,1));
    end
end