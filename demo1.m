close all
a=imread('ct.jpg')
figure
imshow(a)
[LL LH HL HH]=dwt2(a,'haar');
b=idwt2(LL,LH,HL,HH,'haar');
WaveCoeff=[LL,LH; HL, HH]
[FusedWaveletCoeff] = avg(WaveCoeffCT,WaveCoeffMRI)
[r c]=size(FusedWaveletCoeff);
LL=FusedWaveletCoeff((1:r/2),(1:r/2))
LH=FusedWaveletCoeff((1:r/2),((1+r/2):r))
HL=FusedWaveletCoeff(((r/2+1):r),(1:r/2))
HH=FusedWaveletCoeff(((r/2+1):r),(r/2+1):r)
FusedImage=idwt2(LL,LH,HL,HH,'haar')
figure
subplot(1,3,1);imshow(WaveCoeff,[])
subplot(1,3,2);imshow(b,[])
subplot(1,3,3);imshow(FusedImage,[])


