function [STT]=rec2sq(TT,new_h,new_w)
% for i=1:size(TR,3)
% im=TR(:,:,i);
% [h,w]=size(im);
% sclae_size=[new_w,new_h];
% stri=scale(im,sclae_size);
% STR(:,:,i)=stri;
% end

for i=1:size(TT,3)
imTT=TT(:,:,i);
[h,w]=size(imTT);
sclae_size=[new_w,new_h];
stti=scale(imTT,sclae_size);
STT(:,:,i)=stti;
end
% STT=im2uint8(STT);