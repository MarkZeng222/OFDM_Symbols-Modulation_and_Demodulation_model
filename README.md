## OFDM Symbols: Modulation and Demodulation model
*This is a class project which create a Modulation and Demodulation model of <a href="https://en.wikipedia.org/wiki/Orthogonal_frequency-division_multiplexing">OFDM</a> Symbols*

*Matlab trial is available <a href="https://www.mathworks.com/campaigns/products/trials.html?s_eid=ppc_5852767522&q=matlab%20trial&gclid=EAIaIQobChMI8aiR6Z_H3AIVBITICh2poAOLEAAYASAAEgIYPvD_BwE">here</a>*


### Modulation symbols

*Function <a href="https://github.com/MarkZeng222/OFDM_Symbols-Modulation_and_Demodulation_model/blob/master/qpsk.m">qpsk()</a> returns the QPSK modulation symbols in a 1-by-4 vector.*
*(The returned values are normalized so that the amplitude of each symbol is 1.)*

*Function <a href="https://github.com/MarkZeng222/OFDM_Symbols-Modulation_and_Demodulation_model/blob/master/aqm16.m">qam16()</a> returns the 16-QAM modulation symbols in a 1- by-16 vector.*
*(The real and imaginary components are chosen from {- 3k, -k, k, 3k}, 
where k is a constant. The value of k is chosen so that the average power 
(i.e., the expected squared amplitude) of the constellation is 1.)*


### OFDM symbol generator

*Function <a href="https://github.com/MarkZeng222/OFDM_Symbols-Modulation_and_Demodulation_model/blob/master/ofdmSymbol.m">ofdmSymbol(m)</a> returns a 1-by-2048 vector representing the OFDM symbol, taking the*
*sum over all subcarriers multiplied by their respective modulation symbol*
*Parameter m is a 1-by-12 vector of complex modulation symbols*



##### Diagram of OFDM symbols generated by QPSK


<a href="https://ibb.co/dvjv68"><img src="https://preview.ibb.co/krPv68/OFDMsymbols_QPSK.png" alt="OFDMsymbols QPSK" border="0" height="300" width="400"/></a>





##### Diagram of OFDM symbols generated by 16-QAM


<a href="https://ibb.co/eTAPzT"><img src="https://preview.ibb.co/heMmDo/OFDMsymbols_16_QAM.png" alt="OFDMsymbols 16 QAM" border="0" height="300" width="400"/></a>


### OFDM demodulator

*Function <a href="https://github.com/MarkZeng222/OFDM_Symbols-Modulation_and_Demodulation_model/blob/master/ofdmDemod.m">ofdmDemod(k,s)</a> returns the modulation symbol that was multiplied by the kth subcarrier. (assume no noise in this system)*
*Parameter k is the identity of the subcarrier that user want to demodulate (k can be 0,1,...,11 to represent subcarrier frequency 0, 1/Ts, 2/Ts, ...,
11/Ts, respectively)*
*Parameter s is a 1-by-2048 vector representing the OFDM symbol*


### Tester


##### Tester for ofdmSymbol and ofdmDemod use 16-QAM symbol

```
Generate a 16-QAM symbol:
k = 1/sqrt(10);
aqm_m = aqm16(k);
m1 = aqm_m(randi(16,1,12)); %choose 12 random modulation symbols

```

```
Below shows a 1x12 column vector: m1
Columns 1 through 4
0.3162 - 0.9487i 0.3162 - 0.9487i 0.3162 + 0.9487i 0.3162 - 0.9487i Columns 5 through 8
0.9487 - 0.3162i 0.3162 - 0.9487i -0.9487 - 0.3162i 0.3162 + 0.3162i Columns 8 through 12
0.3162 + 0.3162i -0.9487 - 0.9487i -0.3162 + 0.3162i 0.9487 - 0.3162i

```

```
Console Output 1:
Trial>> tester
Enter kth number 0~11: 3 0.3162 - 0.9487i

Console Output 2:
Trial>> tester
Enter kth number 0~11: 7 0.3162 + 0.3162i

Console Output 3:
Trial>> tester
Enter kth number 0~11: 11 0.9487 - 0.3162i

```

##### Tester for ofdmSymbol and ofdmDemod use QPSK symbol

```
Generate a QPSK symbol: m2 = qpsk();
m2 = m2(randi(4,1,12));
```


```
Below shows a 1x12 column vector: m2
Columns 1 through 4
0.3162 + 0.3162i 0.3162 + 0.3162i -0.3162 + 0.9487i 0.9487 - 0.3162i Columns 5 through 8
0.9487 - 0.3162i 0.3162 - 0.9487i 0.9487 - 0.3162i 0.3162 - 0.9487i Columns 9 through 12
0.3162 + 0.3162i 0.3162 - 0.9487i 0.9487 - 0.3162i -0.3162 + 0.9487i
```

```
Console Output 1:
Trial>> tester
Enter kth number 0~11: 4 0.9487 - 0.3162i

Console Output 2:
Trial>> tester
Enter kth number 0~11: 8 0.3162 + 0.3162i

Console Output 3:
Trial>> tester
Enter kth number 0~11: 10 0.9487 - 0.3162i
```