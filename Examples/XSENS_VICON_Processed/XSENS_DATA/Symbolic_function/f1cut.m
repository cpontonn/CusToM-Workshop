function [R1cut,p1cut] = f1cut(in1,in2,in3)
%F1CUT
%    [R1CUT,P1CUT] = F1CUT(IN1,IN2,IN3)

%    This function was generated by the Symbolic Math Toolbox version 8.1.
%    13-Nov-2018 10:44:06

q44 = in1(44,:);
q45 = in1(45,:);
q46 = in1(46,:);
q47 = in1(47,:);
q48 = in1(48,:);
t2 = sin(q48);
t3 = cos(q48);
t4 = sin(q47);
t5 = cos(q47);
R1cut = reshape([t3,t2.*t4,-t2.*t5,0.0,t5,t4,t2,-t3.*t4,t3.*t5],[3,3]);
if nargout > 1
    p1cut = [q44;q45;q46];
end
