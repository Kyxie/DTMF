# Production and Detection of Dual-Tone Multi-Frequency (DTMF) Signals
This is a course project of DSP, Year 3, UESTC & Glasgow Joint School.  
Dual-Tone Multi-Frequency (DTMF) Signals have been widely used in telephone systems, DTMF signals are widely used in telephone systems. 4 low-frequency signals and 4 high-frequency signals consist a 4×4 matrix, which has 16 intersections, each key represents for an intersection. If one key is pressed, the corresponding 2 signals will be superposed together as the input of the system. We can detect the superposed signal and analyse the conponents to determine which key people pressed.  
## Generating
Each key in panel corresponds to a signal consisting of two frequency components, so the input signal can be determined as:  
![](http://latex.codecogs.com/png.latex?x[n]=cos(2\pi(f_L)nT_s)+cos(2\pi(f_H)nT_s))  
In this project, we use digital oscillator to generate in stead of sine or cosine waves provided by MATLAB.    
The basic principle can be shown in my report.
## Detecting
We can use DTFT to analyse the spectrum of x[n], in order to separate the 2 signals.  
Furthermore, Goertzel Algorithm is another good method, the details are shown in my report.
