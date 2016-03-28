//Name: Ganesh Mode
//Roll no.: ee14b083
// IIT Madras
//      Input arguments : 1. d1=denominator of 1st filter H1(Z)
//                        2. d2=denominator of 1st filter H2(Z)
//                        3. beta_=a factor given by user
//                                If it is a linear combination of H1(z)andH2(Z)
//
//      Output arguments=1. b =numerator of resultant filter
//                          a =denominator of resultant filter
//                          bp=numerator corresponding to "power complementary filter G(z)"
//
// Using  Numerator and denominator you can plot filter
//
// resource: 1. 'http://in.mathworks.com/help/dsp/ref/ca2tf.html'
//           2. Digital signal processing course In IIT Madras EE2004
//

function [b,a,bp] = ca2tf(d1,d2,varargin)
    if(argn(2)>3) then
        disp(error("Too many input arguments"));
        return;
    else
        if(argn(2)==3) then
            bet=varargin(1);
            //disp(varargin(1));
            // checking weather  beta_ is complex or not
            if(abs(bet-bet')>0) then//imaginary part checking
                // numerator of all pass filter is    "flip(d1')"
                n1=d1';
                n2=d2';
                n1=flipdim(n1,2);
                n2=flipdim(n2,2);
                // multiplication of two polynomials using "conv" function
                b=(-bet'*conv(n1,d2)+bet*conv(n2,d1))/2;
                a=conv(d1,d2);
                bp=(-bet'*conv(n1,d2)+bet*conv(n2,d1))*(-%i*0.5);
                return;
            else
                disp("Beta should be complex");
                return;
            end
            //For Real value of beta_ do this
        else
            // numerator of all pass filter is    "flip(d1')"
            n1=d1';
            n2=d2';
            n1=flipdim(n1,2);
            n2=flipdim(n2,2);
            b=(conv(n1,d2)+conv(n2,d1))/2;
            a=conv(d1,d2);
            //disp(a,b);
            bp=(conv(n1,d2)-conv(n2,d1))/2;
            return;
        end
    end
endfunction
