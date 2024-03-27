function [Bflip] = fli(B)

[n,m]=size(B);
Bf1=zeros(n,m);%(4*n,4*m);
Bf2=zeros(n,m);
Bf1=imrotate(B,180);
Bf1=[Bf1,flipud(B)];
Bf2=fliplr(B);
Bf2=[Bf2,B];
Bflip=[Bf1;Bf2];
end

