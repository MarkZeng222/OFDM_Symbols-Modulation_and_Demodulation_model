function [ofdm_symbol] = ofdmSymbol(m) 
%Parameter m is a 1-by-12 vector of complex modulation symbols

Ts = 2048 / 30.72e6;
Tsamp = Ts /2048; %inverse of sample frequency = t

t = 0:Tsamp:(2047*Tsamp);%range of Ts
M = zeros(12,2048); %allocate martix

    for i = 0:11
        M(i+1,:) = exp(j*2*pi*i/Ts*t); %subcarriers with frequency 0, 1/Ts, 2/Ts, ..., 11/Ts
    end
 
ofdm_symbol = zeros(1,2048); %allocate martix

    for i = 1:12
        ofdm_symbol = ofdm_symbol + m(i)*M(i,:); %sum over all subcarriers multiplied by their respective modulation symbol
    end

    
    
end

