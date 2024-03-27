function s = sumsqr(a)
%SUMSQR   Sum squared element function.
%         (See LEARNWH, LEARNBP)
%
%         SUMSQR(A)
%           A - a matrix.
%         Returns the sum of squared elements in A.

%         M.H. Beale & H.B. Demuth, 1-31-92
%         Copyright (c) 1992-93 by the MathWorks, Inc.

if nargin ~= 1
  error('Wrong number of arguments.');
  end

s = sum(sum(a.*a));

