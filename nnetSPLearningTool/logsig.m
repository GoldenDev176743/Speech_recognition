function a = logsig(n,b)
%LOGSIG   Logistic Sigmoid Activation Transfer Function.
%         Returns elements of N squashed between 0 and 1
%         using the log-sigmoid function shifted by a bias.
%         (See LEARNBP, NWLOG, TANSIG)
% 
%         LOGSIG(N)
%           N - SxQ matrix of net input vectors.
%         Returns the log-sigmoid with bias of 0.
%
%         LOGSIG(N,B) ...Used when Batching.
%           B - Sx1 vector of biases.
%         Returns the log-sigmoid using the biases
%           in each row of B for elements in
%           corresponding rows of N.
%
%         WARNING: LOGSIG is intended for use with
%           real valued arguments.  Use complex
%           arguments at your own risk!
%          
%         M.H. Beale & H.B. Demuth, 1-31-92
%         Copyright (c) 1992-93 by the MathWorks, Inc.

if nargin < 1 | nargin > 2
  error('Wrong number of arguments.');
  end

if nargin==1
  z = n;
else
  [nr,nc] = size(n);
  z = n + b*ones(1,nc);
  end

  a = 1 ./ (1+exp(-z));

%i = find(~finite(a));
%i = isfinite(a);
%a(i) = sign(z(i))*0.5 + 0.5;

