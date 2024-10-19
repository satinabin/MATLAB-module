
thetaFit = thetaData; % 弧度的范围

xFit = 6.541*cos(1.38*thetaFit-0.3614)-3.853*thetaFit+8.072; % x坐标拟合公式（旋转为垂直之前）
yFit = 5.34*sin(1.38*thetaFit+0.0006883)+6.674*thetaFit-0.0005801; % y坐标拟合公式（旋转为垂直之前）
zFit = 5.34*cos(1.38*thetaFit+7.132)+6.674*thetaFit-3.496; % z坐标拟合公式（旋转为垂直之前）


lnHandleFit = plot3(xFit, yFit, zFit, 'k-'); % 画拟合的曲线
axis equal
rotate(lnHandleFit, cross([0 0 1], [-3.853 6.674 6.674]), -acos(dot([0 0 1], [-3.853 6.674 6.674])/(norm([-3.853 6.674 6.674])))/pi*180, [0 0 0]);
% 保存拟合曲线为垂直方向后的坐标
xNew = lnHandleFit.XData;
yNew = lnHandleFit.YData;
zNew = lnHandleFit.ZData;

plot3(xNew, yNew, zNew, 'k-','linewidth',6.32)
axis equal

%拟合曲线转为垂直方向后的坐标重新拟合

xNewFit = 7.043*cos(1.374*thetaFit)+6.064;
yNewFit = 7.017*sin(1.374*thetaFit)+3.496;
zNewFit = 10.19*thetaFit-5.34;
plot3(xNewFit, yNewFit, zNewFit, 'k-','linewidth',6.32);
axis equal