% Author: Hamid Reza Tanhaei
% FFT algorithm simulation based on radix-2
clc
clear
close all
Wres = 8; % Weight bits
Amp = 0.5;    % Amplitude of input peak to peak
Vref = 1.65;   % ADC Voltage Ref 
ADCres = 11; % ADC Resolution bits - 1 (signed)
%SNR = 10; 
FinalDevide = 14; % Final bits discarded
NN=32; % number of samples
Tsampling = 330e-9; % ADC speed 330ns
Fclk=1/Tsampling; %2e6; % sampling freq 3MHz
Fout=(1*(6/(NN*Tsampling))) % freq of input sin
Sampling_Ratio = Fclk/Fout;
Teta=(Fout/Fclk)*2*pi;
dT=(Teta/(2*pi))*(1/Fout);
Fs=1/dT;
tt=0:1:NN-1;
time=tt*dT;
ph_ran = 0;
offset = 0;

Gain = Amp*((2^ADCres)-1)/Vref; % ((2^8)-1);
x1=offset + sin(Teta*tt + ph_ran);
%x1 = awgn(x1,SNR);
x1 = x1*Gain;
x1 = x1 + (2^11);
x2 = x1;
for (k=1:1:32)
    if (x1(k) > (2^12-1))
        x2(k) = (2^12-1);
    elseif (x1(k) < 0 ) %(-1*(2^11-1)))
        x2(k) = 0; %(2^11-1)*(-1);
    else 
        x2(k) = (x1(k));
    end
end
x3 = floor(x2);
subplot(3,1,1);
plot(time,real(x2));
title('input signal')
%x1 = awgn(x1,20,'measured');
x2 = x2 - (2^11);
for (k=0:1:31)
    x(2*k+1) = x2(k+1);
    x(2*k+1+1) = 0; % (x1(k+1));
end
x = floor(x);
N=32;
s=5; %s=log2(N);
%for m=4:-1:0 % m=s-1:-1:0
 %m=4:
 for k=0:1:15
    Weight(2*k+1) = real(exp(-pi*1i*k/16));
    Weight(2*k+1+1) = imag(exp(-pi*1i*k/16));
 end
 Weight = Weight * ((2^Wres)-1);
 Weight = round(Weight);
 %Weight'
 overflow=0;
for p=0:1:15
        for k=p:(32):N-1
            a_r = x(2*k+1);
            a_i = x(2*k+1+1);
            b_r = x(2*k+32+1);
            b_i = x(2*k+1+32+1);
            %w=(exp(-pi*1i*p/16));
            w_r = (Weight(2*p+1));
            w_i = (Weight(2*p+1+1));
            %x(k+1)=b+x(k+16+1);
            x(2*k+1) = (a_r + b_r);
            x(2*k+1+1) = (a_i + b_i);
            if (x(2*k+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1) < -32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+1) < -32000)
                overflow = overflow + 1; 
            end
            %
           % x(k+16+1)=(b-x(k+16+1))*w;
            x(2*k+32+1) = (((a_r - b_r) * w_r) - ((a_i - b_i) * w_i)) / (2^Wres);
            x(2*k+1+32+1) = (((a_r - b_r) * w_i) + ((a_i - b_i) * w_r)) / (2^Wres); 
            if (x(2*k+32+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+32+1) < -32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+32+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+32+1) < -32000)
                overflow = overflow + 1; 
            end
            
        end
end
x = floor(x);
%stem(x);
 %m=3:
for p=0:1:7
        for k=p:16:N-1
            a_r = x(2*k+1);
            a_i = x(2*k+1+1);
            b_r = x(2*k+16+1);
            b_i = x(2*k+1+16+1);
            %t=(exp(-pi*1i*2*p/16));
            %w=Weight(2*p+1);
            w_r = (Weight(4*p+1));
            w_i = (Weight(4*p+1+1));
            %x(k+1)=b+x(k+8+1);
            x(2*k+1) = (a_r + b_r);
            x(2*k+1+1) = (a_i + b_i);
            if (x(2*k+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1) < -32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+1) < -32000)
                overflow = overflow + 1; 
            end
            
            %x(k+8+1)=(b-x(k+8+1))*t;
            x(2*k+16+1) = (((a_r - b_r) * w_r) - ((a_i - b_i) * w_i)) / (2^Wres);
            x(2*k+1+16+1) = (((a_r - b_r) * w_i) + ((a_i - b_i) * w_r)) / (2^Wres);
            if (x(2*k+16+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+16+1) < -32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+16+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+16+1) < -32000)
                overflow = overflow + 1; 
            end
            
        end
end
x = floor(x);
 %m=2:
for p=0:1:3
        for k=p:8:N-1
            a_r = x(2*k+1);
            a_i = x(2*k+1+1);
            b_r = x(2*k+8+1);
            b_i = x(2*k+1+8+1);
            %t=(exp(-pi*1i*4*p/16));
            %t=Weight(4*p+1);
            w_r = (Weight(8*p+1));
            w_i = (Weight(8*p+1+1));
            
            %x(k+1)=b+x(k+4+1);
            x(2*k+1) = (a_r + b_r);
            x(2*k+1+1) = (a_i + b_i);
            if (x(2*k+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1) < -32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+1) < -32000)
                overflow = overflow + 1; 
            end
            
            %x(k+4+1)=(b-x(k+4+1))*t;
            x(2*k+8+1) = (((a_r - b_r) * w_r) - ((a_i - b_i) * w_i)) / (2^Wres);
            x(2*k+1+8+1) = (((a_r - b_r) * w_i) + ((a_i - b_i) * w_r)) / (2^Wres);
            if (x(2*k+8+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+8+1) < -32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+8+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+8+1) < -32000)
                overflow = overflow + 1; 
            end
            
        end
end
x = floor(x);
 %m=1:
for p=0:1:1
        for k=p:4:N-1
            a_r = x(2*k+1);
            a_i = x(2*k+1+1);
            b_r = x(2*k+4+1);
            b_i = x(2*k+1+4+1);
            %t=(exp(-pi*1i*8*p/16));
            %t=Weight(8*p+1);
            w_r = (Weight(16*p+1));
            w_i = (Weight(16*p+1+1));
            
            %x(k+1)=b+x(k+2+1);
            x(2*k+1) = (a_r + b_r);
            x(2*k+1+1) = (a_i + b_i);
            if (x(2*k+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1) < -32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+1) < -32000)
                overflow = overflow + 1; 
            end
            %x(k+2+1)=(a-x(k+2+1))*t;
            x(2*k+4+1) = (((a_r - b_r) * w_r) - ((a_i - b_i) * w_i)) / (2^Wres);
            x(2*k+1+4+1) = (((a_r - b_r) * w_i) + ((a_i - b_i) * w_r)) / (2^Wres);
            if (x(2*k+4+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+4+1) < -32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+4+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+4+1) < -32000)
                overflow = overflow + 1; 
            end
            
        end
end
x = floor(x);
 %m=0:
%for p=0:1:0
p=0;
        for k=p:(2):N-1
            a_r = x(2*k+1);
            a_i = x(2*k+1+1);
            b_r = x(2*k+2+1);
            b_i = x(2*k+1+2+1);
            %t=(exp(-pi*1i*16*p/16));
            %t=Weight(16*p+1);
            w_r = (Weight(32*p+1));
            w_i = (Weight(32*p+1+1));
            
            %x(k+1)=a+x(k+1+1);
            x(2*k+1) = (a_r + b_r);
            x(2*k+1+1) = (a_i + b_i);
            if (x(2*k+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1) < -32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+1) < -32000)
                overflow = overflow + 1; 
            end
            
            %x(k+1+1)=(b-x(k+1+1))*t;
            x(2*k+2+1) = (((a_r - b_r) * w_r) - ((a_i - b_i) * w_i)) / (2^Wres);
            x(2*k+1+2+1) = (((a_r - b_r) * w_i) + ((a_i - b_i) * w_r)) / (2^Wres);
            if (x(2*k+2+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+2+1) < -32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+2+1) > 32000)
                overflow = overflow + 1; 
            end
            if (x(2*k+1+2+1) < -32000)
                overflow = overflow + 1; 
            end
            
        end
%end
x = floor(x);
%stem(x)

%end
for (k=0:1:31)
    xf(k+1) = x(2*k+1) + 1i*x(2*k+1+1);
end

y=bitrevorder(xf);
Yout = abs(y(1:16)); % floor(((abs(y(1:16))).^2) / (2^FinalDevide));
%Yout = floor(((abs(y(1:16))).^2) / (2^FinalDevide));
%for (k=1:1:16)
%    if (Yout(k) > (2^15-1))
%    overflow = overflow + 1;
%    end
%end

overflow

%y=(xf);
subplot(3,1,2);
stem(Yout);
title('My FFT');
%stem(abs(y));
%stem(x);
subplot(3,1,3);
MatFFT = abs(fft(x2)); 
stem(MatFFT(1:16));
title('Matlab FFT');