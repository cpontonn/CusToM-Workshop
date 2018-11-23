function out1 = pBackOfHead_Position(in1,in2,in3)
%PBACKOFHEAD_POSITION
%    OUT1 = PBACKOFHEAD_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    13-Nov-2018 10:43:35

R4cut1_1 = in3(28);
R4cut1_2 = in3(31);
R4cut1_3 = in3(34);
R4cut2_1 = in3(29);
R4cut2_2 = in3(32);
R4cut2_3 = in3(35);
R4cut3_1 = in3(30);
R4cut3_2 = in3(33);
R4cut3_3 = in3(36);
p4cut1 = in2(10);
p4cut2 = in2(11);
p4cut3 = in2(12);
q7 = in1(7,:);
q14 = in1(14,:);
q15 = in1(15,:);
q16 = in1(16,:);
t2 = cos(q7);
t3 = sin(q7);
t4 = sin(q15);
t5 = R4cut1_3.*t2;
t6 = R4cut1_1.*t3;
t7 = t5+t6;
t8 = cos(q15);
t9 = cos(q14);
t10 = R4cut1_2.*t9;
t11 = sin(q14);
t12 = R4cut1_1.*t2;
t15 = R4cut1_3.*t3;
t13 = t12-t15;
t14 = t10-t11.*t13;
t16 = cos(q16);
t17 = R4cut2_3.*t2;
t18 = R4cut2_1.*t3;
t19 = t17+t18;
t20 = R4cut2_2.*t9;
t21 = R4cut2_1.*t2;
t25 = R4cut2_3.*t3;
t22 = t21-t25;
t23 = t20-t11.*t22;
t24 = sin(q16);
t26 = R4cut3_3.*t2;
t27 = R4cut3_1.*t3;
t28 = t26+t27;
t29 = R4cut3_2.*t9;
t30 = R4cut3_1.*t2;
t33 = R4cut3_3.*t3;
t31 = t30-t33;
t32 = t29-t11.*t31;
out1 = [R4cut1_2.*4.040225700552812e-1+p4cut1+R4cut1_1.*t2.*3.62352080767068e-3-R4cut1_3.*t3.*3.62352080767068e-3+t4.*t7.*1.310256402086621e-2+t8.*t14.*1.310256402086621e-2+t24.*(R4cut1_2.*t11+t9.*t13).*2.529486393613218e-4+t16.*(t7.*t8-t4.*t14).*2.529486393613218e-4;R4cut2_2.*4.040225700552812e-1+p4cut2+R4cut2_1.*t2.*3.62352080767068e-3-R4cut2_3.*t3.*3.62352080767068e-3+t4.*t19.*1.310256402086621e-2+t8.*t23.*1.310256402086621e-2+t24.*(R4cut2_2.*t11+t9.*t22).*2.529486393613218e-4-t16.*(t4.*t23-t8.*t19).*2.529486393613218e-4;R4cut3_2.*4.040225700552812e-1+p4cut3+R4cut3_1.*t2.*3.62352080767068e-3-R4cut3_3.*t3.*3.62352080767068e-3+t4.*t28.*1.310256402086621e-2+t8.*t32.*1.310256402086621e-2+t24.*(R4cut3_2.*t11+t9.*t31).*2.529486393613218e-4-t16.*(t4.*t32-t8.*t28).*2.529486393613218e-4];
