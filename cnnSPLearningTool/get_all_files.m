% ??????
%path = fullfile('I:/Thesis/S2/SparseWaveletP/voiceTest2/16_digits');
function  [spch2,cnt]=get_all_files(path,files,MS)
%  cnt=0;
%  H=[];
% L=[];%length of every speech data
% Orig='0001';%the first pattern
% for fileIndex=3:length(files2)
% %files=fullfile(files(fileIndex).folder);
% 
% if (files2(fileIndex).isdir == 0)
% if (~isempty(strfind(files2(fileIndex).name,'wav')))
%             fullfile(path2,files2(fileIndex).name);
%             [data,fs] = audioread(fullfile(path2,files2(fileIndex).name));
%              data=VADSTE(data,0.02);
% %              data=data';
%              l=length(data');
%              L=[L,l];
%              %data=data/max(abs(data));
%              
% %             spch1=sdwdgramNEWD(data);%with VADSTE, TH=0.03
% %             S=size(spch1);
% %             H=[H;S];
% %             cnt=cnt+1;
% %             spch1(:,:,cnt)=spch1;
%            
% end
% end
% end
% MS=max(L);%maximum of speech length
% D=[];%put all speech together
cnt=0;
for fileIndex=3:length(files)


if (files(fileIndex).isdir == 0)
if (~isempty(strfind(files(fileIndex).name,'wav')))
            fullfile(path,files(fileIndex).name);
            [data,fs] = audioread(fullfile(path,files(fileIndex).name));
             data=VADSTE(data,0.025);
%              data=data';
             data=[data;zeros(MS-length(data),1)];
             %D=[D,data];
             
             spch1=sdwdgramNEWD(data);%with VADSTE, TH=0.03
             S=size(spch1);
             %H=[H;S];
             cnt=cnt+1;
             spch2(:,:,cnt)=spch1;
%              label=ones(4,1)*circshift(Orig,n);
%              label(:,:,cnt)=label;
            
           
end
end
end
end