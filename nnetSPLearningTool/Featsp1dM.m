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

st_0=floor(rand(1,25)*(length(zero1d)-480*64-1)); % make 25 random starting points for speech sample of zero
st_1=floor(rand(1,25)*(length(one1d)-480*64-1)); % make 25 random starting points for speech sample of one
st_2=floor(rand(1,25)*(length(two1d)-480*64-1)); % make 25 random starting points for speech sample of two
st_3=floor(rand(1,25)*(length(three1d)-480*64-1)); % make 25 random starting points for speech sample of three
TP=[];  % training patern features
T=[];   % taget vectors

for i=1:25
    x=zero1d(st_0(i):length(zero1d));
    x=mfcc1d(x,Fs);
    TP=[ TP; x];
    T=[ T; [0.9 0.1 0.1 0.1]];
end
for i=1:25
    x=one1d(st_1(i):length(one1d));
    x=mfcc1d(x,Fs);
    TP=[ TP; x];
    T=[ T; [0.1 0.9 0.1 0.1]];
end
for i=1:25
    x=two1d(st_2(i):length(two1d));
    x=mfcc1d(x,Fs);
    TP=[ TP; x];
    T=[ T; [0.1 0.1 0.9 0.1]];
end
for i=1:25
    x=three1d(st_3(i):length(three1d));
    x=mfcc1d(x,Fs);
    TP=[ TP; x];
    T=[ T; [0.1 0.1 0.1 0.9]];
end

st_0=floor(rand(1,10)*(length(zero1d)-480*64-1));% make 10 random starting points for speech sample of zero
st_1=floor(rand(1,10)*(length(one1d)-480*64-1));% make 10 random starting points for speech sample of one
st_2=floor(rand(1,10)*(length(two1d)-480*64-1)); % make 10 random starting points for speech sample of two
st_3=floor(rand(1,10)*(length(three1d)-480*64-1));% make 10 random starting points for speech sample of three

TT=[]; % test pattern features
TL=[]; % test target vectors (desired)
for i=1:10
    x=zero1d(st_0(i):length(zero1d));
    x=mfcc1d(x,Fs);
    TT=[ TT; x];
    TL=[ TL; [0.9 0.1 0.1 0.1]];
end
for i=1:10
    x=one1d(st_1(i):length(one1d));
    x=mfcc1d(x,Fs);
    TT=[ TT; x];
    TL=[ TL; [0.1 0.9 0.1 0.1]];
end
for i=1:10
    x=two1d(st_2(i):length(two1d));
    x=mfcc1d(x,Fs);
    TT=[ TT; x];
    TL=[ TL; [0.1 0.1 0.9 0.1]];
end
for i=1:10
    x=three1d(st_3(i):length(three1d));
    x=mfcc1d(x,Fs);
    TT=[ TT; x];
    TL=[ TL; [0.1 0.1 0.1 0.9]];
end
TP=TP';TT=TT';T=T';TL=TL';
save TP.mat;
save TT.mat;
save T.mat;
save TL.mat;