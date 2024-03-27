close all;clear all;clc
fs=8000;
load ZERO.DAT
zero=ZERO/max(abs(ZERO));
sound(zero,fs);
pause(2); %wat for 2 seconds
zero=mfccgram(zero);
load ONE.DAT
one=ONE/max(abs(ONE));
sound(one,fs)
pause(2)
one=mfccgram(one);
load TWO.DAT
two=TWO/max(abs(TWO));
sound(two,fs)
pause(2)
two=mfccgram(two);
load THREE.DAT
three=THREE/max(abs(THREE));
sound(three,fs)
pause(2)
three=mfccgram(three);
load FOUR.DAT
four=FOUR/max(abs(FOUR));
sound(four,fs)
pause(2)
four=mfccgram(four);
load FIVE.DAT
five=FIVE/max(abs(FIVE));
sound(five,fs)
pause(2)
five=mfccgram(five);
load SIX.DAT
six=SIX/max(abs(SIX));
sound(six,fs)
pause(2)
six=mfccgram(six);
load SEVEN.DAT
seven=SEVEN/max(abs(SEVEN));
s7=seven;
sound(seven,fs)
pause(2)
seven=mfccgram(seven);
figure
colororder([0 0 1])
subplot(2,2,1); imshow(zero),title('0');xlabel('Frame number');ylabel('Band number');
subplot(2,2,2); imshow(one);title('1');xlabel('Frame number');ylabel('Band number');
subplot(2,2,3); imshow(two);title('2');xlabel('Frame number');ylabel('Band number');
subplot(2,2,4); imshow(three);title('3');xlabel('Frame number');ylabel('Band number');
figure
subplot(2,2,1); imshow(four);title('4');xlabel('Frame number');ylabel('Band number');
subplot(2,2,2); imshow(five);title('5');xlabel('Frame number');ylabel('Band number');
subplot(2,2,3); imshow(six);title('6');xlabel('Frame number');ylabel('Band number');
subplot(2,2,4); imshow(seven);title('7');xlabel('Frame number');ylabel('Band number');