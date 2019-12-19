function [R5cut,p5cut] = f5cut(in1,in2,in3)
%F5CUT
%    [R5CUT,P5CUT] = F5CUT(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.2.
%    17-Dec-2019 14:41:33

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
q11 = in1(11,:);
q12 = in1(12,:);
q13 = in1(13,:);
q36 = in1(36,:);
q37 = in1(37,:);
t2 = cos(q7);
t3 = sin(q7);
t4 = sin(q11);
t5 = cos(q11);
t6 = R4cut1_1.*t2;
t15 = R4cut1_3.*t3;
t7 = t6-t15;
t8 = cos(q13);
t9 = cos(q12);
t10 = R4cut1_3.*t2;
t11 = R4cut1_1.*t3;
t12 = t10+t11;
t13 = sin(q12);
t14 = R4cut1_2.*t5;
t22 = t4.*t7;
t16 = t14-t22;
t24 = t9.*t12;
t25 = t13.*t16;
t17 = t24-t25;
t18 = sin(q13);
t19 = R4cut1_2.*t4;
t20 = t5.*t7;
t21 = t19+t20;
t23 = cos(q36);
t26 = t8.*t17;
t27 = t18.*t21;
t28 = t26+t27;
t29 = sin(q36);
t30 = t8.*t21;
t31 = sin(q37);
t32 = t12.*t13;
t33 = t9.*t16;
t34 = t32+t33;
t35 = cos(q37);
t36 = t23.*t28;
t37 = t29.*(t30-t17.*t18);
t38 = t36+t37;
t39 = R4cut2_1.*t2;
t46 = R4cut2_3.*t3;
t40 = t39-t46;
t41 = R4cut2_3.*t2;
t42 = R4cut2_1.*t3;
t43 = t41+t42;
t44 = t9.*t43;
t45 = R4cut2_2.*t5;
t52 = t4.*t40;
t47 = t45-t52;
t53 = t13.*t47;
t48 = t44-t53;
t49 = R4cut2_2.*t4;
t50 = t5.*t40;
t51 = t49+t50;
t54 = t8.*t48;
t55 = t18.*t51;
t56 = t54+t55;
t57 = t8.*t51;
t58 = t13.*t43;
t59 = t9.*t47;
t60 = t58+t59;
t61 = t23.*t56;
t62 = t29.*(t57-t18.*t48);
t63 = t61+t62;
t64 = R4cut3_1.*t2;
t71 = R4cut3_3.*t3;
t65 = t64-t71;
t66 = R4cut3_3.*t2;
t67 = R4cut3_1.*t3;
t68 = t66+t67;
t69 = t9.*t68;
t70 = R4cut3_2.*t5;
t77 = t4.*t65;
t72 = t70-t77;
t78 = t13.*t72;
t73 = t69-t78;
t74 = R4cut3_2.*t4;
t75 = t5.*t65;
t76 = t74+t75;
t79 = t8.*t73;
t80 = t18.*t76;
t81 = t79+t80;
t82 = t8.*t76;
t83 = t13.*t68;
t84 = t9.*t72;
t85 = t83+t84;
t86 = t23.*t81;
t87 = t29.*(t82-t18.*t73);
t88 = t86+t87;
R5cut = reshape([-t28.*t29+t23.*(t30-t17.*t18),-t29.*t56+t23.*(t57-t18.*t48),-t29.*t81+t23.*(t82-t18.*t73),t31.*t38+t34.*t35,t31.*t63+t35.*t60,t31.*t88+t35.*t85,-t31.*t34+t35.*t38,-t31.*t60+t35.*t63,-t31.*t85+t35.*t88],[3,3]);
if nargout > 1
    p5cut = [R4cut1_2.*2.576422176091082e-1+p4cut1+R4cut1_1.*t2.*3.680603108701546e-2-R4cut1_1.*t3.*1.953550880772359e-2-R4cut1_3.*t2.*1.953550880772359e-2-R4cut1_3.*t3.*3.680603108701546e-2-t8.*t17.*1.625127834123857e-1-t9.*t16.*1.330679585432427e-2-t12.*t13.*1.330679585432427e-2-t8.*t21.*3.944851536955706e-2+t17.*t18.*3.944851536955706e-2-t18.*t21.*1.625127834123857e-1;R4cut2_2.*2.576422176091082e-1+p4cut2+R4cut2_1.*t2.*3.680603108701546e-2-R4cut2_1.*t3.*1.953550880772359e-2-R4cut2_3.*t2.*1.953550880772359e-2-R4cut2_3.*t3.*3.680603108701546e-2-t8.*t48.*1.625127834123857e-1-t9.*t47.*1.330679585432427e-2-t13.*t43.*1.330679585432427e-2-t8.*t51.*3.944851536955706e-2+t18.*t48.*3.944851536955706e-2-t18.*t51.*1.625127834123857e-1;R4cut3_2.*2.576422176091082e-1+p4cut3+R4cut3_1.*t2.*3.680603108701546e-2-R4cut3_1.*t3.*1.953550880772359e-2-R4cut3_3.*t2.*1.953550880772359e-2-R4cut3_3.*t3.*3.680603108701546e-2-t8.*t73.*1.625127834123857e-1-t9.*t72.*1.330679585432427e-2-t13.*t68.*1.330679585432427e-2-t8.*t76.*3.944851536955706e-2+t18.*t73.*3.944851536955706e-2-t18.*t76.*1.625127834123857e-1];
end