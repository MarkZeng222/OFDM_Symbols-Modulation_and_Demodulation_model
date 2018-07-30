function [states] = aqm16(k)
% returns the 16-QAM modulation symbols in a 1- by-16 vector
% k = 1/sqrt(10) => average power of the constellation is 1

states = [];
amplitude = [-3*k -k k 3*k];
pos = [amplitude(3) amplitude(4)];
neg = [amplitude(2) amplitude(1)];
total_states = 16;
energy = 0;

for i = 1:2
    for z = 1:2       
       states = horzcat(states,complex(pos(i),pos(z)));%first quadrant
       states = horzcat(states,complex(pos(i),neg(z)));%second quadrant 
       states = horzcat(states,complex(neg(i),neg(z)));%third quadrant
       states = horzcat(states,complex(neg(i),pos(z)));%fourth quadrant
    end
end


for t = 1:1:total_states
    
    energy = energy + (abs(states(t)))^2; %abs: magnitude of complex number
                                          %get sum of energy
       
      
end
avg_energy = energy / total_states;% get average energy

if(avg_energy - 1 <= 0.1) % if average energy is approximately equal to 1 
    avg_energy = floor(avg_energy); 
end


if avg_energy~= 1  %average energy is not 1
    error('The value of k should be chosen so that the average power of the constellation is 1');
end



end

