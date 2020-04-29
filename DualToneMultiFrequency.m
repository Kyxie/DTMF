%% Initial Part
clear;
clc;
prompt = 'Input the Number:\n';
key_in = input(prompt);
Ts = 1/8000;
n = 0:205;
w = n/length(n)/Ts;
row = [1209 1336 1477 1633];
col = [697 770 852 941];
%% Input Part
switch key_in
   case 1
      freq1 = row(1,1);
      freq2 = col(1,1);
   case 2
      freq1 = row(1,2);
      freq2 = col(1,1);
   case 3
      freq1 = row(1,3);
      freq2 = col(1,1);
   case 'A'
      freq1 = row(1,4);
      freq2 = col(1,1);
   case 4
      freq1 = row(1,1);
      freq2 = col(1,2);
   case 5
      freq1 = row(1,2);
      freq2 = col(1,2);
   case 6
      freq1 = row(1,3);
      freq2 = col(1,2);
   case 'B'
      freq1 = row(1,4);
      freq2 = col(1,2);
   case 7
      freq1 = row(1,1);
      freq2 = col(1,3);
   case 8
      freq1 = row(1,2);
      freq2 = col(1,3);
   case 9
      freq1 = row(1,3);
      freq2 = col(1,3);
   case 'C'
      freq1 = row(1,4);
      freq2 = col(1,3);
   case '*'
      freq1 = row(1,1);
      freq2 = col(1,4);
   case 0
      freq1 = row(1,2);
      freq2 = col(1,4);
   case '#'
      freq1 = row(1,3);
      freq2 = col(1,4);
   case 'D'
      freq1 = row(1,4);
      freq2 = col(1,4);
   otherwise
      disp('Invalid Input£¡');
end
%% Processing by cos()
% x = cos(2*pi*freq1.*n*Ts) + cos(2*pi*freq2.*n*Ts);
% X = fft(x);
%% Processing by Digital Oscillator
omega1 = 2*pi*freq1*Ts;
omega2 = 2*pi*freq2*Ts;
A1 = cos(omega1);
A2 = cos(omega2);

m = zeros(1,length(n)+2); % Generate the impulse signal
for i = 1:length(n)+2
    if(i == 3)
        m(1,i) = 1;
    end
end

x1 = zeros(1,length(n)+2);    % Generate the input signal
x2 = zeros(1,length(n)+2);

for i = 3:length(n)+2
    x1(1,i) = 2*A1*x1(1,i-1) - x1(1,i-2) + m(1,i) - A1*m(1,i-1);
    x2(1,i) = 2*A2*x2(1,i-1) - x2(1,i-2) + m(1,i) - A2*m(1,i-1);
end

x1(:,1)=[]; % Delete initial condition components
x1(:,1)=[];
x2(:,1)=[];
x2(:,1)=[];
x = x1 + x2;
X = fft(x);
%% Detecting Part
K = [18 20 22 24 31 34 38 42];
Xgk = goertzel(x,K+1);
%% Plotting Part
% figure
% stem(n,real(x),'filled');
% title('x[n] in time Domain');
% xlabel('n');
% ylabel('x[n]');
% grid on;
% axis([0 205 -2.5 2.5]);
% 
% figure
% plot(w,abs(X)*2/length(X));
% title('The Amplitude of X(ejw) in Frequency Domain');
% xlabel('Freq/Hz');
% ylabel('|X(ejw)|');
% grid on;
% 
% figure
% plot(w/pi,angle(X)/pi);
% title('The Phase of X(ejw) in Frequency Domain');
% xlabel('Freq/Hz');
% ylabel('\theta/\pi');
% grid on;
% axis([0 2540 -1 1]);

figure
stem(K,abs(Xgk));
title('Press 1');
xlabel('K');
ylabel('|X(K)|');
grid on;
axis([10 50 0 120]);