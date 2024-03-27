function plottr(tr,t)
%PLOTERR  Plots record of network error and (optionally)
%         adaptive learning rate during training.
%         (See BARERR, ERRSURF)
%
%         PLOTTR(TR)
%           TR - row of network errors with OPTIONAL
%                second row of learning rates.
%           T  - (Optional) String for graph title.
%                Default is 'Network Training Record'.

%         M.H. Beale & H.B. Demuth, 1-31-92
%         Copyright (c) 1992-93 by the MathWorks, Inc.

if nargin > 2 | nargin < 1
  error('Wrong number of arguments.');
  end

clf reset
[r,c] = size(tr);

if r >= 2
  subplot(211)
  end

semilogy(0:c-1,tr(1,:));
xlabel('Epoch')
ylabel('Sum-Squared Error')
if nargin == 1
  title('Network Error')
else
  title(t)
  end

if r >= 2
  subplot(212)
  plot(0:c-1,tr(2,:));
  xlabel('Epoch')
  ylabel('Learning Rate')
  if nargin == 1
    title('Network Learning Rate')
  else
    title(t)
    end
  end
drawnow
set(gcf,'NextPlot','replace')

