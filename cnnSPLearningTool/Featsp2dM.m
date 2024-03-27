clear all; close all; clc
[spch,Fs]=audioread('zero.wav');
spch=spch(:,1);
zero1d=spch';
[spch,Fs]=audioread('one.wav');
spch=spch(:,1);
one1d=spch';
[spch,Fs]=audioread('two.wav');
spch=spch(:,1);
two1d=spch';
[spch,Fs]=audioread('three.wav');
spch=spch(:,1);
three1d=spch';

% Data normalization
zero1d=zero1d/max(abs(zero1d)); %normalization 
one1d=one1d/max(abs(one1d)); %normalization 
two1d=two1d/max(abs(two1d)); %normalization 
three1d=three1d/max(abs(three1d)); %normalization 

st_0=floor(rand(1,25)*(length(zero1d)-480*64-1));
st_1=floor(rand(1,25)*(length(one1d)-480*64-1));
st_2=floor(rand(1,25)*(length(two1d)-480*64-1));
st_3=floor(rand(1,25)*(length(three1d)-480*64-1));
TP=[];  % training patern features
T=[];   % taget vectors

for i=1:25
    x=zero1d(st_0(i):length(zero1d));
    x=mfccgram2d(x,Fs);
    TP2(:,:,i)=x; % vertical axis for frequency and horizotal axis for time
    T=[ T; [1 0 0 0]];
end
for i=1:25
    x=one1d(st_1(i):length(one1d));
    x=mfccgram2d(x,Fs);
    TP2(:,:,i+25)=x; % vertical axis for frequency and horizotal axis for time
    T=[ T; [0 1 0 0]];
end
for i=1:25
    x=two1d(st_2(i):length(two1d));
    x=mfccgram2d(x,Fs);
    TP2(:,:,i+50)=x; % vertical axis for frequency and horizotal axis for time
    T=[ T; [0 0 1 0]];
end
for i=1:25
    x=three1d(st_3(i):length(three1d));
    x=mfccgram2d(x,Fs);
    TP2(:,:,i+75)=x; % vertical axis for frequency and horizotal axis for time
    T=[ T; [0 0 0 1]];
end
st_0=floor(rand(1,25)*(length(zero1d)-480*64-1));
st_1=floor(rand(1,25)*(length(one1d)-480*64-1));
st_2=floor(rand(1,25)*(length(two1d)-480*64-1));
st_3=floor(rand(1,25)*(length(three1d)-480*64-1));

TT=[]; % test pattern features
TL=[]; % test target vectors (desired)
for i=1:10
    x=zero1d(st_0(i):length(zero1d));
    x=mfccgram2d(x,Fs);
    TT2(:,:,i)=x; % vertical axis for frequency and horizotal axis for time
    TL=[ TL; [1 0 0 0]];
end
for i=1:10
    x=one1d(st_1(i):length(one1d));
    x=mfccgram2d(x,Fs);
    TT2(:,:,i+10)=x; % vertical axis for frequency and horizotal axis for time
    TL=[ TL; [0 1 0 0]];
end
for i=1:10
    x=two1d(st_2(i):length(two1d));
    x=mfccgram2d(x,Fs);
    TT2(:,:,i+20)=x; % vertical axis for frequency and horizotal axis for time
    TL=[ TL; [0 0 1 0]];
end
for i=1:10
    x=three1d(st_3(i):length(three1d));
    x=mfccgram2d(x,Fs);
    TT2(:,:,i+30)=x; % vertical axis for frequency and horizotal axis for time
    TL=[ TL; [0 0 0 1]];
end
T2=T';TL2=TL';
save TP2.mat;
save TT2.mat;
save T2.mat;
save TL2.mat;