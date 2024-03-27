
close all;clear all;clc;

load TP.mat;
load TT.mat;
load T.mat;
load TL.mat;
%     
% % teach the neural network with three layers

% teach nueral network with three layers
[w1, b1, w2, b2, w3,b3, te ,tr]=...
 trainbp(randn(80,25),randn(80,1),'logsig',...
 randn(40,80),randn(40,1),'logsig',...
 randn(4,40),randn(4,1),'logsig',TP,T,[1 200 0.001, 0.015]);

disp('test network');
% 
PT=TT;
LT=TL;
disp('Network out=>');
layer1out=logsig(w1*PT,b1);
layer2out=logsig(w2*layer1out,b2);
networ_out=logsig(w3*layer2out,b3)
networ_out=round(networ_out);
disp('Accuracy=>');
count=0;
[m n] =size(LT);
for i=1:n
    if sum(abs((networ_out(:,i) - round(LT(:,i)))')) ~= 0
        count=count+1;
    end
end
accuracy=(n-count)/n
