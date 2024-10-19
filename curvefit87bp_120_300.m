thetaFit = thetaData; % 弧度的范围

xFit = 10.2*cos(1.072*thetaFit-0.1587)-3.113*thetaFit+4.355; % x坐标拟合公式（旋转为垂直之前）
yFit = 11.18*sin(1.072*thetaFit+0.001474)+1.797*thetaFit+0.006632; % y坐标拟合公式（旋转为垂直之前）
zFit = 6.448*cos(1.072*thetaFit-15.26)-5.391*thetaFit+5.655; % z坐标拟合公式（旋转为垂直之前）


lnHandleFit = plot3(xFit, yFit, zFit, 'k-'); % 画拟合的曲线
axis equal
rotate(lnHandleFit, cross([0 0 1], [-3.113 1.797 -5.391]), -acos(dot([0 0 1], [-3.113 1.797 -5.391])/(norm([-3.113 1.797 -5.391])))/pi*180, [0 0 0]);
% 保存拟合曲线为垂直方向后的坐标
xNew = lnHandleFit.XData;
yNew = lnHandleFit.YData;
zNew = lnHandleFit.ZData;

plot3(xNew, yNew, zNew, 'k-','linewidth',6.32)
axis equal

%拟合曲线转为垂直方向后的坐标重新拟合

xNewFit = 11.63*cos(1.072*thetaFit-2.169)+1.093;
yNewFit = 11.64*sin(1.072*thetaFit+0.9715)+1.89;
zNewFit = 6.479*thetaFit-6.795;
plot3(xNewFit, yNewFit, zNewFit, 'k-','linewidth',6.32);
axis equal