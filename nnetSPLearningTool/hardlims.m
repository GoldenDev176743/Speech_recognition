function a = hardlims(n,b)
%HARDLIMS Symmetric Hardlimit Activation Transfer Function.
%         Returns -1 for elements of N below the -bias
%         and 1 for elements above it.
%         (See HARDLIM, LEARNP, TRAINP)
% 
%         HARDLIMS(N)
%           N - SxQ matrix of net input vectors.
%         Returns the symmetric hardlimit with bias of 0.
%
%         HARDLIMS(N,B) ...Used when Batching.
%           B - Sx1 vector of biases.
%         Returns the symmetric hardlimit using the
%           bias in each row of B for elements in
%           corresponding rows of N.

%         M.H. Beale & H.B. Demuth, 1-31-92
%         Copyright (c) 1992-93 by the MathWorks, Inc.

if nargin < 1 | nargin > 2
  error('Wrong number of arguments.');
  end

if nargin==1
  a = 2*(n >= 0)-1;
else
  [nr,nc] = size(n);
  a = 2*(n >= -b*ones(1,nc))-1;
  end

