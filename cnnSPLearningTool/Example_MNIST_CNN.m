
clear all; close all
display 'start....'
load TP2.mat;
load TT2.mat;
load T2.mat; 
load TL2.mat;
[h w numTP2]=size(TP2)
[h w numTT2]=size(TT2)

train_x=TP2;
test_x=TT2;
train_y = T2;
test_y=TL2;
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%% We create our arbitary CNN and train it with MNIST dataset
%%%%% The architecture of CNN is arbitrarily choosen for experimental purpose
%%%%% The architecture may be revised for better result.

%   cnnAddConvLayer - Add convolution layer
%   cnn, no_of_feature_maps, sizeof(kernels), activation function -'sigm' 
%   for sigmoid, 'tanh' for tanh, 'rect' for ReLu, 'soft' for softmax, 
%  'none' for none, 'plus' for softplus.

% cnnAddPoolLayer - Add Pool layer
% cnn, subsampling factor, subsampling type. Presently only 'mean'
% subsampling is implemented.

%cnnAddFCLayer - Add fully connected neural network layer
% cnn, no of NN nodes, activation function.


%% xx = xx - mean(xx(:));
%size(images);
% initialize cnn
clear cnn;
cnn.namaste=1; % just intiationg cnn object
cnn=initcnn(cnn,[h w])

%%% Example 3
[cnn K]=cnnAddConvLayer(cnn, 6, [17 17], 'rect');
 cnn=cnnAddPoolLayer(cnn, 2, 'mean');
cnn=cnnAddConvLayer(cnn, 12, [5 5], 'tanh');
 cnn=cnnAddPoolLayer(cnn, 2, 'mean');
 cnn=cnnAddConvLayer(cnn, 6, [3 3], 'sigm');
cnn=cnnAddPoolLayer(cnn, 2, 'mean');
cnn=cnnAddFCLayer(cnn,150, 'tanh' ); %add fully connected layer
cnn=cnnAddFCLayer(cnn,50, 'sigm' ); %add fully connected layer % last layer no of nodes = no of lables
cnn=cnnAddFCLayer(cnn,4, 'sigm' );
display 'training started...Wait for ~200 seconds...'
tic
%%
%%%more parameters
%cnn.loss_func = 'cros';

%cnn.loss_func = 'quad'; 
no_of_epochs = 100;
batch_size=25; % number of trainning patterns/batch_size must be integer
cnn=traincnn(cnn,train_x,train_y, no_of_epochs,batch_size);
toc

display '...training finished.'
display 'testing started....'
tic
err=testcnn(cnn, test_x, test_y);
toc
display '... testing finished. To get minimum error, increase no of epochs while training.'