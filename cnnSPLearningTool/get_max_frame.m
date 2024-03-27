function  MS=get_max_frame(path2,files2)
 %cnt=0;
 %H=[];
L=[];%length of every speech data
%Orig='0001';%the first pattern
for fileIndex=3:length(files2)
%files=fullfile(files(fileIndex).folder);

if (files2(fileIndex).isdir == 0)
if (~isempty(strfind(files2(fileIndex).name,'wav')))
            fullfile(path2,files2(fileIndex).name);
            [data,fs] = audioread(fullfile(path2,files2(fileIndex).name));
             data=VADSTE(data,0.02);
%              data=data';
             l=length(data');
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
MS=max(L);%maximum of speech length
MS=MS+mod(MS,2);%get the closet even number