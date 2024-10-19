
thetaFit = thetaData; % 弧度的范围

xFit = 2.208*cos(2.144*thetaFit-0.9544)-6.225*thetaFit+13.05; % x坐标拟合公式（旋转为垂直之前）
yFit = 1.395*sin(2.145*thetaFit+0.006597)+10.78*thetaFit+0.00367; % y坐标拟合公式（旋转为垂直之前）
zFit = 2.407*cos(2.145*thetaFit+0.4444)+3.594*thetaFit-1.88; % z坐标拟合公式（旋转为垂直之前）

lnHandleFit = plot3(xFit, yFit, zFit, 'k-'); % 画拟合的曲线
axis equal
rotate(lnHandleFit, cross([0 0 1], [-6.225 10.78 3.594]), -acos(dot([0 0 1], [-6.225 10.78 3.594])/(norm([-6.225 10.78 3.594])))/pi*180, [0 0 0]);
% 保存拟合曲线为垂直方向后的坐标
xNew = lnHandleFit.XData;
yNew = lnHandleFit.YData;
zNew = lnHandleFit.ZData;

plot3(xNew, yNew, zNew, 'k-','linewidth',6.32)
axis equal

%拟合曲线转为垂直方向后的坐标重新拟合

xNewFit = 2.403*cos(2.127*thetaFit)+9.802;
yNewFit = 2.4*sin(2.128*thetaFit)+5.64;
zNewFit = 12.96*thetaFit-6.788;
plot3(xNewFit, yNewFit, zNewFit, 'k-','linewidth',6.32);
axis equal