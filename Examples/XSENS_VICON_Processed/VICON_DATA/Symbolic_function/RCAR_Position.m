function out1 = RCAR_Position(in1,in2,in3)
%RCAR_POSITION
%    OUT1 = RCAR_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    06-Nov-2018 17:35:36

R6cut1_1 = in3(46);
R6cut1_2 = in3(49);
R6cut1_3 = in3(52);
R6cut2_1 = in3(47);
R6cut2_2 = in3(50);
R6cut2_3 = in3(53);
R6cut3_1 = in3(48);
R6cut3_2 = in3(51);
R6cut3_3 = in3(54);
p6cut1 = in2(16);
p6cut2 = in2(17);
p6cut3 = in2(18);
q31 = in1(31,:);
q32 = in1(32,:);
q33 = in1(33,:);
q34 = in1(34,:);
q35 = in1(35,:);
t2 = cos(q31);
t3 = sin(q31);
t4 = cos(q33);
t5 = R6cut1_3.*t2;
t6 = R6cut1_1.*t3;
t7 = t5+t6;
t8 = sin(q33);
t9 = sin(q32);
t10 = R6cut1_2.*t9;
t11 = cos(q32);
t12 = R6cut1_1.*t2;
t17 = R6cut1_3.*t3;
t13 = t12-t17;
t14 = t11.*t13;
t15 = t10+t14;
t16 = t7.*t8;
t18 = t16-t4.*t15;
t19 = cos(q34);
t20 = sin(q34);
t21 = R6cut1_2.*t11;
t22 = t21-t9.*t13;
t23 = sin(q35);
t24 = R6cut2_3.*t2;
t25 = R6cut2_1.*t3;
t26 = t24+t25;
t27 = R6cut2_2.*t9;
t28 = R6cut2_1.*t2;
t34 = R6cut2_3.*t3;
t29 = t28-t34;
t30 = t11.*t29;
t31 = t27+t30;
t32 = cos(q35);
t33 = t8.*t26;
t35 = t33-t4.*t31;
t36 = R6cut2_2.*t11;
t37 = t36-t9.*t29;
t38 = R6cut3_3.*t2;
t39 = R6cut3_1.*t3;
t40 = t38+t39;
t41 = R6cut3_2.*t9;
t42 = R6cut3_1.*t2;
t47 = R6cut3_3.*t3;
t43 = t42-t47;
t44 = t11.*t43;
t45 = t41+t44;
t46 = t8.*t40;
t48 = t46-t4.*t45;
t49 = R6cut3_2.*t11;
t50 = t49-t9.*t43;
out1 = [R6cut1_2.*(-3.681426522125268e-1)+p6cut1-R6cut1_2.*t11.*3.134470175030693e-1+t9.*t13.*3.134470175030693e-1+t18.*t19.*1.861629801907788e-2-t20.*t22.*1.861629801907788e-2-t23.*(t4.*t7+t8.*t15).*9.103369731329086e-2-t32.*(t18.*t20+t19.*t22).*9.103369731329086e-2;R6cut2_2.*(-3.681426522125268e-1)+p6cut2-R6cut2_2.*t11.*3.134470175030693e-1+t9.*t29.*3.134470175030693e-1+t19.*t35.*1.861629801907788e-2-t20.*t37.*1.861629801907788e-2-t23.*(t4.*t26+t8.*t31).*9.103369731329086e-2-t32.*(t20.*t35+t19.*t37).*9.103369731329086e-2;R6cut3_2.*(-3.681426522125268e-1)+p6cut3-R6cut3_2.*t11.*3.134470175030693e-1+t9.*t43.*3.134470175030693e-1+t19.*t48.*1.861629801907788e-2-t20.*t50.*1.861629801907788e-2-t23.*(t4.*t40+t8.*t45).*9.103369731329086e-2-t32.*(t20.*t48+t19.*t50).*9.103369731329086e-2];
