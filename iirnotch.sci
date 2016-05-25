// Scilab ( http://www.scilab.org/ ) - This file is part of Scilab
// Copyright (C) INRIA -
// Copyright (C) DIGITEO - 2010 - 2016 Ganesh Mode
//
//Name: Ganesh Mode
//Roll no.: ee14b083
//IIT Madras
//      Input arguments : 1.w0=frequency that you want to notch
//                          variation of w0 is -pi to pi
//                        2.bp= is related to quality factor i.e it will decide the sharpness of curve
//                          bp can take 0 to 0.5
//                        3.ab= is specified in db scale
//
//      Output arguments :1.n=numerator of notch filter
//                        2.d=denominator of notch filter
//
// Using  Numerator and denominator you can plot filter
//


function [n,d] = iirnotch(w0,bw,varargin)
    msg='';
    
    msg=argnchk(2,3); //checking args
//    disp(msg);
    
    if ~isempty(msg) then
        error(msg);
    end
    
    ab=abs(10*log10(0.5)); // 3-dB width default
    
    msg = freq_n_Bandwidth(w0,bw);
    
    if ~isempty(msg) then
        error(msg);
    end                 //check limit of args
    
    opt=0;
    if(argn(2)==3) then  // optional argument check
        opt=varargin(1);
    end
    
    /// finding whether it is an number as well as numeric
    if (or(type(opt)==[1 5 8])) & (size(opt)==1) then
        ab=abs(opt)
    else
        msg = 'Level of decibels specified by Ab must be a numeric scalar.';
    end
    if ~isempty(msg) then
        error(msg);
    end
    
    bw = bw*%pi;
    w0 = w0*%pi;

    Gb= 10^(-ab/20);
    bet = (sqrt(1-Gb.^2)/Gb)*tan(bw/2);
    gain = 1/(1+bet);

    n  = gain*[1 -2*cos(w0) 1];
    d  = [1 -2*gain*cos(w0) (2*gain-1)];
    
    
endfunction

//----------------------------------------------------------


function msg=freq_n_Bandwidth(w0,bw)
// Check w0 and BW for notch filter.

    msg = '';
// Validate frequency cutoff and bandwidth.
    if (w0<=0) | (w0 >= 1) then
        msg = 'The frequency Wo must be within 0 and 1.';
        return;
    end
    
    if (bw <= 0) | (bw >= 1) then
        msg = 'The bandwidth BW must be within 0 and 1.';
        return;
    end
endfunction


//-------------------------------------------------------------

function msg=argnchk(minarg,maxarg)
    msg='';
    if(argn(2)<minarg) then
        msg='No. of arguments are less';
        return;
    elseif(argn(2)>maxarg) then
        msg='No. of arguments are more';
        return;
    end
endfunction

//---------------------------------------------
