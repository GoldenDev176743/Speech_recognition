function d = deltatan(a,d,w)
%DELTATAN Logistic Delta Function.
%         Returns the delta values for tan-sigmoid neurons.
%         (See DELTALIN, DELTALOG, LEARNBP, TANSIG, TRAINBP)
%         
%         DELTATAN(A,E)
%           A - S1xQ matrix of output vectors
%           E - S1xQ matrix of associated errors
%         Returns an SxQ matrix of output layer delta vectors.
%
%         DELTATAN(A,D,W)
%           D - S2xQ matrix of next layer delta vectors
%           W - S2xS1 weight matrix between layers.
%         Returns an SxQ matrix of hidden layer delta vectors.

%         M.H. Beale & H.B. Demuth, 1-31-92
%         Copyright (c) 1992-93 by the MathWorks, Inc.

if nargin < 2 | nargin > 3
  error('Wrong number of arguments.');
  end

if nargin == 2
  d = (ones-(a.*a)).*d;
else
  d = (ones-(a.*a)).*(w'*d);
end

