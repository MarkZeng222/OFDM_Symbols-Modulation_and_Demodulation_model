function [m] = ofdmDemod(k,s)
% s is a 1-by-2048 vector representing the OFDM symbol
% k is the identity of the subcarrier [0,1, 2, ..., 11]
if k < 0 || k > 11
    error('Enter k from [0,1, 2, ..., 11]');
end

k = k + 1; %increment index by 1
Ts = 2048 / 30.72e6;

%Fast Fourier transform 
L_x = length(s);
NDFT = 2^nextpow2(L_x); % Next power of 2 from length of x
X =[s zeros(1,NDFT-L_x)];
Y = zeros(1,NDFT);
for f = 0:NDFT-1
    Y(f+1) = 0;
    for n = 0:NDFT-1
        Y(f+1)=Y(f+1)+(X(n+1)*exp((-1j)*2*pi*f*n/L_x));
    end
end
z = Y(1:12);
z = z/Ts/30720000;
m = z(k);

end

