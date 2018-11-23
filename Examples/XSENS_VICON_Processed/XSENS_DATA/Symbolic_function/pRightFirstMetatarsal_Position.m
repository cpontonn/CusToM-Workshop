function out1 = pRightFirstMetatarsal_Position(in1,in2,in3)
%PRIGHTFIRSTMETATARSAL_POSITION
%    OUT1 = PRIGHTFIRSTMETATARSAL_POSITION(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    13-Nov-2018 10:43:49

R3cut1_1 = in3(19);
R3cut1_2 = in3(22);
R3cut1_3 = in3(25);
R3cut2_1 = in3(20);
R3cut2_2 = in3(23);
R3cut2_3 = in3(26);
R3cut3_1 = in3(21);
R3cut3_2 = in3(24);
R3cut3_3 = in3(27);
p3cut1 = in2(7);
p3cut2 = in2(8);
p3cut3 = in2(9);
q22 = in1(22,:);
t2 = cos(q22);
t3 = sin(q22);
out1 = [R3cut1_1.*1.305315737111914e-1+p3cut1-R3cut1_2.*t2.*5.852571917248574e-2-R3cut1_2.*t3.*7.136122480794066e-2+R3cut1_3.*t2.*7.136122480794066e-2-R3cut1_3.*t3.*5.852571917248574e-2;R3cut2_1.*1.305315737111914e-1+p3cut2-R3cut2_2.*t2.*5.852571917248574e-2-R3cut2_2.*t3.*7.136122480794066e-2+R3cut2_3.*t2.*7.136122480794066e-2-R3cut2_3.*t3.*5.852571917248574e-2;R3cut3_1.*1.305315737111914e-1+p3cut3-R3cut3_2.*t2.*5.852571917248574e-2-R3cut3_2.*t3.*7.136122480794066e-2+R3cut3_3.*t2.*7.136122480794066e-2-R3cut3_3.*t3.*5.852571917248574e-2];
