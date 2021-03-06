function out1 = LTARI_Position(in1,in2,in3)
%LTARI_POSITION
%    OUT1 = LTARI_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    17-Dec-2019 14:53:12

R2cut1_1 = in3(10);
R2cut1_2 = in3(13);
R2cut1_3 = in3(16);
R2cut2_1 = in3(11);
R2cut2_2 = in3(14);
R2cut2_3 = in3(17);
R2cut3_1 = in3(12);
R2cut3_2 = in3(15);
R2cut3_3 = in3(18);
p2cut1 = in2(4);
p2cut2 = in2(5);
p2cut3 = in2(6);
q26 = in1(26,:);
t2 = cos(q26);
t3 = sin(q26);
out1 = [R2cut1_1.*1.351045687874461e-1+p2cut1-R2cut1_2.*t2.*5.292755298089676e-2-R2cut1_2.*t3.*3.78185102655052e-2+R2cut1_3.*t2.*3.78185102655052e-2-R2cut1_3.*t3.*5.292755298089676e-2;R2cut2_1.*1.351045687874461e-1+p2cut2-R2cut2_2.*t2.*5.292755298089676e-2-R2cut2_2.*t3.*3.78185102655052e-2+R2cut2_3.*t2.*3.78185102655052e-2-R2cut2_3.*t3.*5.292755298089676e-2;R2cut3_1.*1.351045687874461e-1+p2cut3-R2cut3_2.*t2.*5.292755298089676e-2-R2cut3_2.*t3.*3.78185102655052e-2+R2cut3_3.*t2.*3.78185102655052e-2-R2cut3_3.*t3.*5.292755298089676e-2];
