FusedWaveletCoeff=magic(4)
[r c]=size(FusedWaveletCoeff);
LL=FusedWaveletCoeff((1:r/2),(1:r/2))
LH=FusedWaveletCoeff((1:r/2),((1+r/2):r))
HL=FusedWaveletCoeff(((r/2+1):r),(1:r/2))
HH=FusedWaveletCoeff(((r/2+1):r),(r/2+1):r)