# Fossee_Ganesh_ee14b083

##For DSP Toolbox

Name: Ganesh Mode

Roll no. : EE14B083 

IIT Madras  


There are three files:

1. ca2tf.sci

2. ismaxphase.sci

3. notch.sci

##ca2tf

1.The ca2tf is a function to convert coupled all pass filter to H(z) given H1(z) H2(z).

2.you can import this function in your programme or environment.

3.input is d1,d2 denominators of H1 and H2.

4.beta_is optional arg

5.output will be n,d of H(z)= 1/2 ( H1(z) + H2(z) ) for real n,d

  for complex n,d,Beta  H(z)= 1/2 ( -b'.H1(z) + b.H2(z) ).

6.And bp numerator of the power complementary filter G(z) = 1/2 ( H1(z) - H2(z) ) for real n,d

  for complex n,d,Beta  G(z)= 1/(2*j) ( -b'.H1(z) + b.H2(z) ).
  
Eg. Input : d1=[1,0.5,0.25]; d2=[1,4,4];

  Output : n=[2.125, 3.75, 4.0, 3.75, 2.125];  a = [1.    4.5    6.25    3.    1.];  bp = [- 1.875  - 2.25    0.    2.25    1.875  ]
  

##ismaxphase

1.The function tells whether H(z) is maxphase or not also for SOS (second order systems)

2.you can import this function in your programme or environment.

3.Input required is n,d or sos anyone at a time.

4.Output will be a flag 0 or 1.

5.the function works as find outs the poles and zeroes and then checks the stability of the system

6.Check1 is a matrix for checking that all poles of transfer function are inside r=1

7.Check2 is a matrix for checking that all zeros of transfer function are outside r=1

So if above condition is true then flag=1.



##notch

1.The function takes input frequency w0 and bp;

2.bp and r the radius of poles is related by equation r=0.999-0.7*bp; This relation is got by plotting "r v/s bp" and then fitting it.

3. Also the bp and Ymax are related by equation Ymax=(1+0.8287314*bp); So to compensate magnitude back to Ymax=1;
