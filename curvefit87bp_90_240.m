thetaFit = thetaData; % 弧度的范围

xFit = 3.66*cos(1.54*thetaFit-0.8433)-7.707*thetaFit+12.12; % x坐标拟合公式（旋转为垂直之前）
yFit = 3.645*sin(1.54*thetaFit+0.006133)+7.707*thetaFit+0.008588; % y坐标拟合公式（旋转为垂直之前）
zFit = 4.446*cos(1.54*thetaFit-2.779)-4.45*thetaFit+3.512; % z坐标拟合公式（旋转为垂直之前）


lnHandleFit = plot3(xFit, yFit, zFit, 'k-'); % 画拟合的曲线
axis equal
rotate(lnHandleFit, cross([0 0 1], [-7.707 7.707 -4.45]), -acos(dot([0 0 1], [-7.707 7.707 -4.45])/(norm([-7.707 7.707 -4.45])))/pi*180, [0 0 0]);
% 保存拟合曲线为垂直方向后的坐标
xNew = lnHandleFit.XData;
yNew = lnHandleFit.YData;
zNew = lnHandleFit.ZData;

plot3(xNew, yNew, zNew, 'k-','linewidth',6.32)
axis equal

%拟合曲线转为垂直方向后的坐标重新拟合

xNewFit = 4.696*sin(1.532*thetaFit)+6.078;
yNewFit = 4.731*cos(1.532*thetaFit)+6.075;
zNewFit = 11.77*thetaFit-9.256;
plot3(xNewFit, yNewFit, zNewFit, 'k-','linewidth',6.32);
axis equal