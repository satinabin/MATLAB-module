
thetaFit = thetaData; % 弧度的范围

xFit = 8.913*cos(1.161*thetaFit-0.253)-3.597*thetaFit+5.652; % x坐标拟合公式（旋转为垂直之前）
yFit = 8.911*sin(1.161*thetaFit+0.001234)+3.597*thetaFit-0.0006038; % y坐标拟合公式（旋转为垂直之前）
zFit = 6.299*cos(1.161*thetaFit-8.765)-6.229*thetaFit+4.897; % z坐标拟合公式（旋转为垂直之前）


lnHandleFit = plot3(xFit, yFit, zFit, 'k-'); % 画拟合的曲线
axis equal
rotate(lnHandleFit, cross([0 0 1], [-3.597 3.597 -6.229]), -acos(dot([0 0 1], [-3.597 3.597 -6.229])/(norm([-3.597 3.597 -6.229])))/pi*180, [0 0 0]);
% 保存拟合曲线为垂直方向后的坐标
xNew = lnHandleFit.XData;
yNew = lnHandleFit.YData;
zNew = lnHandleFit.ZData;

plot3(xNew, yNew, zNew, 'k-','linewidth',6.32)
axis equal

%拟合曲线转为垂直方向后的坐标重新拟合

xNewFit = 9.933*sin(1.159*thetaFit)+2.827;
yNewFit = 9.954*cos(1.159*thetaFit)+2.831;
zNewFit = 8.042*thetaFit-6.321;
plot3(xNewFit, yNewFit, zNewFit, 'k-','linewidth',6.32);
axis equal