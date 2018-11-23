function out1 = LWRB_Position(in1,in2,in3)
%LWRB_POSITION
%    OUT1 = LWRB_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    06-Nov-2018 17:35:38

R5cut1_1 = in3(37);
R5cut1_2 = in3(40);
R5cut1_3 = in3(43);
R5cut2_1 = in3(38);
R5cut2_2 = in3(41);
R5cut2_3 = in3(44);
R5cut3_1 = in3(39);
R5cut3_2 = in3(42);
R5cut3_3 = in3(45);
p5cut1 = in2(13);
p5cut2 = in2(14);
p5cut3 = in2(15);
q38 = in1(38,:);
q39 = in1(39,:);
q40 = in1(40,:);
t2 = cos(q38);
t3 = sin(q38);
t4 = sin(q39);
t5 = cos(q39);
t6 = R5cut1_1.*t2;
t7 = t6-R5cut1_3.*t3;
t8 = cos(q40);
t9 = sin(q40);
t10 = R5cut2_1.*t2;
t11 = t10-R5cut2_3.*t3;
t12 = R5cut3_1.*t2;
t13 = t12-R5cut3_3.*t3;
out1 = [R5cut1_2.*(-3.297402730660062e-1)+p5cut1-R5cut1_2.*t5.*2.591016955766787e-1+t4.*t7.*2.591016955766787e-1+t8.*(R5cut1_1.*t3+R5cut1_3.*t2).*2.991102886632655e-2+t9.*(R5cut1_2.*t4+t5.*t7).*2.991102886632655e-2;R5cut2_2.*(-3.297402730660062e-1)+p5cut2-R5cut2_2.*t5.*2.591016955766787e-1+t4.*t11.*2.591016955766787e-1+t8.*(R5cut2_1.*t3+R5cut2_3.*t2).*2.991102886632655e-2+t9.*(R5cut2_2.*t4+t5.*t11).*2.991102886632655e-2;R5cut3_2.*(-3.297402730660062e-1)+p5cut3-R5cut3_2.*t5.*2.591016955766787e-1+t4.*t13.*2.591016955766787e-1+t8.*(R5cut3_1.*t3+R5cut3_3.*t2).*2.991102886632655e-2+t9.*(R5cut3_2.*t4+t5.*t13).*2.991102886632655e-2];
