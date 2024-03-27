
close all; clear all;clc
load TP.mat;
load TT.mat;
load T.mat;
load TL.mat;

%     
% % teach the neural network with two layers
 [w1, b1, w2, b2, te ,tr]=...
  trainbp(randn(100,25),randn(100,1),'logsig',...
  randn(4,100),randn(4,1),'logsig',TP,T,[1 1000 0.001, 0.01]);
% 
% disp('test network');
PT=TT;
LT=TL;
disp('Network out=>');
layer1out=logsig(w1*PT,b1);
networ_out=logsig(w2*layer1out,b2)
disp('Accuracy=>');
count=0;
[m n] =size(LT);
for i=1:n
    if sum(abs((round(networ_out(:,i)) - round(LT(:,i)))')) ~= 0
        count=count+1;
    end
end
accuracy=(n-count)/n