function MFCCS=mfccgram2d(spch,Fs)
nv=64;%25;
flow=300;
fhigh=Fs/2; % bandwidth
nfft=512;
n=66;%27; %number of linespacing = (number of filter banks +2)

%Windowing the Input speech
iWinLen=480;
winOverlap=240;
 s = buffer(spch, iWinLen, winOverlap, 'nodelay');
 s=s.';
 [n1, m1]=size(s); n1=64;
 %periodogram
for i=1:n1
%[p(i,:),a(i,:)]=periodogram(s(i,:),hamming(length(s(i,:))));
x(i,:)=[s(i,:),zeros(1,32)];
x(i,:)=x(i,:)*hamming(1,512);
x(i,:)=fft(x(i,:));
x(i,:)=x(i,:).*conj(x(i,:))/length(x(i,:));
%x(i,:)=x(i,:).*conj(x(i,:))/length(x);
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
    f(i) = floor((nfft+1)*h(i)/Fs);  % obtain the frequency bin
end

%H=zeros(25,256);
H=zeros(64,256);
%generation Of filter Bank
for m =2:(n-1) % m=number of filter bank; k=holds coefficients
           for k=f(m-1):f(m)   
                H(m-1,k)=(k-f(m-1))/(f(m)-f(m-1)); % positive slope
           end
           for k=f(m)+1:f(m+1)
                H(m-1,k)=(f(m+1)-k)/(f(m+1)-f(m)); % negative slope
           end
end
% H(1,:) band 1
% H(2,:) band 2
% H(i,:) band i
%nv=min(nv,25);
nv=min(nv,64);
%applying filter bank to Power spectrum
MFCCS=H(1:nv,1:256)*p';
MFCCS(1:nv,:)=MFCCS(nv:-1:1,:);
%MFCCS=MFCCS/max(max(abs(MFCCS)));
%MFCCS=im2uint8(MFCCS);