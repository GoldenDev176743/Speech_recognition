function [h]=MFScale(n,Fs);
%n=34; %number of linespacing = (number of filter banks +2)
flow=300;
fhigh=Fs/2;

%Filter bank computation
%MEL frequency estimation
mlow=1125*log(1+(flow/700));
mhigh=1125*log(1+(fhigh/700));
Mel=linspace(mlow,mhigh,n);

%converting back to Frequency domain
for i=1:length(Mel)
    h(i)=700*(exp(Mel(i)/1125)-1);
end
