//      Input arguments : 1.w0=frequency that you want to notch
//                          variation of w0 is -pi to pi
//                        2.bp= is related to quality factor i.e it will decide the sharpness of curve
//                          bp can take 0 to 0.5
//
//      Output arguments :1.n=numerator of notch filter
//                        2.d=denominator of notch filter
//
// Using  Numerator and denominator you can plot filter
//
// resource: 1. 'http://in.mathworks.com/help/dsp/ref/iirnotch.html'
//           2. Digital signal processing course In IIT Madras EE2004
//

function [n,d]=notch(w0,bp)
    
    //relationship betwin 'r' v/s 'bp'
    //this is found by plotting r vs bp for w0=0;
    r=.999-0.7*bp;
    w=-%pi:0.001:%pi;
    
    z=(1-exp(%i*(w0-w))).*(1-exp(%i*(2*%pi-w0-w)));
    x=(1-r*exp(%i*(w0-w))).*(1-r*exp(%i*(2*%pi-w0-w)));
    
    y=z./x;
    
    n=[1,-2*cos(w0),1];
    //to compansate the maximum magnitude i.e it should be 1//
    //as the max(y) depends upon bp if we plot max(y) vs bp 
    d=[1,-2*r*cos(w0),r*r];
    d=d*(1+0.8287314*bp);
    
    
    //I you want to plot the filter remove below comments
    //y=abs(y)/(1+0.8287314*bp);
    //plot(w,log(y));
    return;
endfunction

