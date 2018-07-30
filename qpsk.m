function [mod_symbols] = qpsk()
% returns the QPSK modulation symbols in a 1-by-4 vector
% amplitude of each symbol is 1.

    mod_symbols = [];
    

    for r = pi/4:pi/2:2*pi        
        
       mod_symbols = horzcat(mod_symbols,complex(cos(r),sin(r)));
        
    end



end