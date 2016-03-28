//Name: Ganesh Mode
//Roll no.: ee14b083
// IIT Madras
//      Input arguments : 1. [n,d] or sos
//                              n,d =numerator and denominator of a filter
//                              sos = second order system array
//                                    with   size(sos)=(k,6) where k>=2;
//
//      Output arguments : 1. y =flag
//                              flag that tells whether system is maxphase or not 
//                              possible output 0 or 1;
//
// resource: 1. 'http://in.mathworks.com/help/signal/ref/ismaxphase.html'
//           2. Digital signal processing course In IIT Madras EE2004
//


function y = ismaxphase (varargin)
    if(argn(2)>2) then // checking input is SOS or n,d 
        disp('too many args');
        return;
    elseif(argn(2)==0) then
        disp('give input value');
        return;
    else
        if(argn(2)<2) then  // if SOS then DO the Following
            nc=size(varargin(1),"c");
            nr=size(varargin(1),"r");
            if(nc==6) then  //checking arguments are of correct dimension or not
                sos=varargin(1);
                m=1:1:nc;// Array to store output of each sos
                for i=1:1:nr
                    sosn=sos(i,1:3);
                    sosd=sos(i,4:6);
                    if(sosd==0) then//checking any of the sosd==0
                        disp('the value of d is inncorect');
                        y=0;
                        return;
                    else
                        if(sosn==0) then // any of numerator is sosn==0
                            y=0;
                            return;
                        else
                            rn=abs(roots(sosn)); // finding roots
                            rd=abs(roots(sosd));
                            //for un-stable system
                            [r1,c1]=size(rd);
                            check1=ones(r1,c1); // a matrix of ones
                            [r2,c2]=size(rn);
                            check2=ones(r2,c2);
                            if(sum(rd>check1)) then//checking poles are inside unit circle or not
                                m(i)=0;
                            //for stable system
                            else
                                if(sum(rn<=check2)==0) then//checking zeros are outside unit circle or not
                                    m(i)=1;//If one SOS(i) ismaxphase
                                else
                                    m(i)=0;
                                end
                            end
                        end
                    end
                end
                if(min(m)==0) then
                    y=0;//checking any m(i)==0 implies is not max phase
                    return;
                else
                    y=1;
                    return;
                end
            else
                disp('error');
                return;
            end
        else   /// If two arguments are there n and d
            if(varargin(2)==0) then
                disp('the value of d is inncorect');
                y=0;
                return;
            else
                if(varargin(1)==0) then
                    y=0;
                    return;
                else
                    n=varargin(1);
                    d=varargin(2);
                    rn=abs(roots(n));
                    rd=abs(roots(d));
                    //for un-stable system
                    [r1,c1]=size(rd);
                    check1=ones(r1,c1);
                    [r2,c2]=size(rn);
                    check2=ones(r2,c2);
                    if(sum(rd>check1)) then//checking poles are inside unit circle or not
                        y=0;
                        return;
                        //for stable system
                    else
                        if(sum(rn<=check2)==0) then//checking zeros are outside unit circle or not
                            y=1;
                            return;
                        else
                            y=0;
                            return;
                        end
                    end
                end
            end
    end
end
endfunction
