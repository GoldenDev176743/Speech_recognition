function mfcc1=mfcc1d(spch,Fs)
Fs=16000;
flow=300;
fhigh=8000;
nfft=512;
n=27; %number of linespacing = (number of filter banks +2)
%K=(nfft/2)+1;
iWinLen=480;
winOverlap=240;
 s = buffer(spch, iWinLen, winOverlap, 'nodelay');
 s=s.';
 
 %periodogram
for i=1:64
%[p(i,:),a(i,:)]=periodogram(s(i,:),hamming(length(s(i,:))));
x(i,:)=[s(i,:) zeros(1,32)];
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

%generation Of filter Bank
for m =2:(n-1)
           for k=f(m-1):f(m)
                H(m-1,k)=(k-f(m-1))/(f(m)-f(m-1));
           end
            %elseif (k>=f((m)) && k<=f((m+1)));
           for k=f(m)+1:f(m+1)
                H(m-1,k)=(f(m+1)-k)/(f(m+1)-f(m));
           end
           % plot(H(m-1,:));
end

%applying filter bank to Power spectrum
E=H*p';
for i=1:(n-2)
Esum(i,:)=sum(E(i,:));
end

Elog=log2(Esum);
mfcc1=dct(Elog');%since Elog(1)=infinity i am skipping it to calculate dct

