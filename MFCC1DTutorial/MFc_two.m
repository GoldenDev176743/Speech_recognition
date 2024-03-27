%MFCC
clc;
clear all;
close all;

flow=300;
fhigh=8000;
nfft=512;
n=27; %number of linespacing = (number of filter banks +2)
%K=(nfft/2)+1;

%reading and Plotting input speech waveform
[spch,Fs]=audioread('two.wav');
spch=spch(:,3);
spch=spch';
plot(1:length(spch),spch);
grid
sound(spch/max(abs(spch)),Fs)
%Windowing the Input speech
iWinLen=480;
winOverlap=240;  % 50% overlapping
 s = buffer(spch, iWinLen, winOverlap, 'nodelay');
 s=s.';
 
 %periodogram
for i=1:64
%[p(i,:),a(i,:)]=periodogram(s(i,:),hamming(length(s(i,:))));
x(i,:)=[s(i,:),zeros(1,32)]; %for using FFT
x(i,:)=x(i,:)*hamming(1,512);
x(i,:)=fft(x(i,:));
x(i,:)=x(i,:).*conj(x(i,:))/length(x);
p(i,:)=x(i,1:256);
end

%Filter bank computation
%MEL frequency estimation
mlow=1125*log(1+(flow/700));
mhigh=1125*log(1+(fhigh/700));
Mel=linspace(mlow,mhigh,n);

%converting back to Frequency domain
for i=1:length(Mel)
    h(i)=700*(exp(Mel(i)/1125)-1);
    f(i) = floor((nfft+1)*h(i)/Fs);
end

H=zeros(26,256);
figure()
hold
%generation Of filter Bank
for m =2:(n-1)
        %for k=1:256+1
%xx=f((m-1));
            %if (k<f((m-1)))
             %       H(m,k)=0;
            %elseif (k>=f((m-1)) && k<=(f((m))));
           for k=f(m-1):f(m)
                H(m-1,k)=(k-f(m-1))/(f(m)-f(m-1));
           end
            %elseif (k>=f((m)) && k<=f((m+1)));
           for k=f(m)+1:f(m+1)
                H(m-1,k)=(f(m+1)-k)/(f(m+1)-f(m));
           end
           % elseif (k>f((m+1)));H(m,k)=0;
            %end
            plot(H(m-1,:));
        %end
end

%applying filter bank to Power spectrum
E=H*p';
for i=1:(n-2)
Esum(i,:)=sum(E(i,:)); % assume non-zero.
end

Elog=log2(Esum);
MFCC=dct(Elog')%since Elog(1)=infinity i am skipping it to calculate dct

%taking Log
figure; plot(MFCC)
save two MFCC