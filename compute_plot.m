%Plots for QPSK and 16-QAM

Ts = 2048 / 30.72e6;
Tsamp = Ts /2048; %inverse of sample frequency = t
t = 0:Tsamp:(2047*Tsamp);%range of Ts

%Plot 1
%QPSK generates a modulation symbol: m1
m1 = qpsk();
m1 = m1(randi(4,1,12));
ofdm_s = ofdmSymbol(m1);
figure;
plot(t,real(ofdm_s),t,imag(ofdm_s))
title('OFDM symbols generated by QPSK')

%Plot 2
%16-QAM generates a modulation symbol: m2
k = 1/sqrt(10); 
aqm_m = aqm16(k);
m2 = aqm_m(randi(16,1,12)); %choose 12 random modulation symbols
ofdm_s = ofdmSymbol(m2);
figure;
plot(t,real(ofdm_s),t,imag(ofdm_s))
title('OFDM Symbols Generated by 16-QAM')
