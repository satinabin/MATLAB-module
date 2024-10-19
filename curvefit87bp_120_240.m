thetaFit = thetaData; % 弧度的范围

xFit = 4.483*cos(1.259*thetaFit-0.6539)-8.093*thetaFit+11.33; % x坐标拟合公式（旋转为垂直之前）
yFit = 6.346*sin(1.258*thetaFit+0.02577)+4.671*thetaFit+0.03693; % y坐标拟合公式（旋转为垂直之前）
zFit = 6.334*cos(1.259*thetaFit+3.376)-4.672*thetaFit+4.911; % z坐标拟合公式（旋转为垂直之前）


lnHandleFit = plot3(xFit, yFit, zFit, 'k-'); % 画拟合的曲线
axis equal
rotate(lnHandleFit, cross([0 0 1], [-8.093 4.671 -4.672]), -acos(dot([0 0 1], [-8.093 4.671 -4.672])/(norm([-8.093 4.671 -4.672])))/pi*180, [0 0 0]);
% 保存拟合曲线为垂直方向后的坐标
xNew = lnHandleFit.XData;
yNew = lnHandleFit.YData;
zNew = lnHandleFit.ZData;

plot3(xNew, yNew, zNew, 'k-','linewidth',6.32)
axis equal

%拟合曲线转为垂直方向后的坐标重新拟合

xNewFit = 7.12*cos(1.259*thetaFit+3.918)+2.856;
yNewFit = 7.057*sin(1.259*thetaFit+0.7841)+4.928;
zNewFit = 10.45*thetaFit-10.95;
plot3(xNewFit, yNewFit, zNewFit, 'k-','linewidth',6.32);
axis equal