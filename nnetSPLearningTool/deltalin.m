function d = deltalin(a,d,w)
%DELTALIN Logistic Delta Function.
%         Returns the delta values for a layer of linear neurons.
%         (See DELTALOG, DELTATAN, LEARNBP, PURELIN, TRAINBP)
%         
%         DELTALIN(A,E)
%           A - S1xQ matrix of output vectors
%           E - S1xQ matrix of associated errors
%         Returns an SxQ matrix of output layer delta vectors.
%
%         DELTALIN(A,D,W)
%           D - S2xQ matrix of next layer delta vectors
%           W - S2xS1 weight matrix between layers.
%         Returns an SxQ matrix of hidden layer delta vectors.

%         M.H. Beale & H.B. Demuth, 1-31-92
%         Copyright (c) 1992-93 by the MathWorks, Inc.

if nargin < 2 | nargin > 3
  error('Wrong number of arguments.');
  end

if nargin == 2
  d = d;
else
  d = w'*d;
end

