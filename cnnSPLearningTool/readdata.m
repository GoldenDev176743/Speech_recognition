function [TR,TRL,TT,TTL]=readdata(path1,new_h,new_w)
files1= dir(path1);
SPCH=[];
MS=[];%max length of every speech data
TT=[];TR=[];TTL=[];TRL=[];
LB=[];
for files1Index=3:length(files1)
path=fullfile(path1,files1(files1Index).name);
files=dir(path);
cnt=0;
 H=[];
L=[];%length of every speech data

for fileIndex=3:length(files)


if (files(fileIndex).isdir == 0)
if (~isempty(strfind(files(fileIndex).name,'wav')))
            fullfile(path,files(fileIndex).name);
            [data,fs] = audioread(fullfile(path,files(fileIndex).name));
             dataL=VADSTE(data,0.025);
%              data=data';
             l=length(dataL');
             L=[L,l];
             %data=data/max(abs(data));
             
%             spch1=sdwdgramNEWD(data);%with VADSTE, TH=0.03
%             S=size(spch1);
%             H=[H;S];
%             cnt=cnt+1;
%             spch1(:,:,cnt)=spch1;
           
end
end

end
LL=max(L);
MS=[MS,LL];
end
MS=max(MS);
%%read all data again
for files1Index=3:length(files1)
path=fullfile(path1,files1(files1Index).name);
files=dir(path);
cnt=0;
 H=[];
D=[];%put all speech together
label=files1Index;
LABEL=[];
%
spch1=[];
spch2=[];
for fileIndex=3:length(files)


if (files(fileIndex).isdir == 0)
if (~isempty(strfind(files(fileIndex).name,'wav')))
            fullfile(path,files(fileIndex).name);
            [data,fs] = audioread(fullfile(path,files(fileIndex).name));
             data=VADSTE(data,0.025);
%              data=data';
             data=[data;zeros(MS-length(data),1)];
             D=[D,data];
             data=data/max(abs(data));%%%%%
             spch1=sdwdgramNEWD(data);
             spch1=rec2sq(spch1,new_h,new_w);
             spch1=fli(spch1);
             %spch1=im2uint8(spch1);
             S=size(spch1);
             H=[H;S];
             cnt=cnt+1;
             spch2(:,:,cnt)=spch1;
             LABEL=[LABEL,label];
           
end
end
end
LB=[LB,LABEL];
%unidrnd(N),the random integer from 1 to N
R=2*round(0.05*size(spch2,3));%R= 2*unidrnd(round(0.1*size(spch2,3)));%the # of Test data or labels
%data
tt=spch2(:,:,1:R);
tr=spch2(:,:,R+1:size(spch2,3));
TT=cat(3,TT,tt);
TR=cat(3,TR,tr);
SPCH=cat(3,SPCH,spch2);
%labels
ttl=LABEL(1:R);
trl=LABEL(R+1:length(LABEL));
TTL=[TTL,ttl];
TRL=[TRL,trl];
end