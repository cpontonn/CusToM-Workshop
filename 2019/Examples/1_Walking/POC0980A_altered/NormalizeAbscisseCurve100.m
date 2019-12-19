function [vq] = NormalizeAbscisseCurve100(y)
for ii=1:size(y,2)
    x=0:100/(length(y(:,ii))-1):100;
    xq=0:1:100;
    vq(:,ii)=interp1(x,y(:,ii),xq,'pchip')';
end
end

