close all
a=imread('ct.jpg')
b=imread('mri.jpg')

[LL1 LH1 HL1 HH1]=dwt2(a,'haar');
[LL2 LH2 HL2 HH2]=dwt2(b,'haar');
WaveCoeffCT=[LL1,LH1; HL1, HH1]
WaveCoeffMRI=[LL2,LH2; HL2, HH2]
figure
subplot(1,2,1);imshow(WaveCoeffCT,[])
subplot(1,2,2);imshow(WaveCoeffMRI,[])
[FusedWaveletCoeff] = avg(WaveCoeffCT,WaveCoeffMRI)
[r c]=size(FusedWaveletCoeff);
LL=FusedWaveletCoeff((1:r/2),(1:r/2))
LH=FusedWaveletCoeff((1:r/2),((1+r/2):r))
HL=FusedWaveletCoeff(((r/2+1):r),(1:r/2))
HH=FusedWaveletCoeff(((r/2+1):r),(r/2+1):r)
FusedImage=idwt2(LL,LH,HL,HH,'haar')
figure
subplot(1,3,1);imshow(a,[])
subplot(1,3,2);imshow(b,[])
subplot(1,3,3);imshow(FusedImage,[])