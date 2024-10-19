% 参数
D = 87*0.34*3/pi; %直径 87*0.34*3/2/pi  约14.12*2
d = 6.32; %线径,得下面手动修改
dtheta = 120; %每一段对应的角度（此处修改为60）
turning = 240; %每一段的旋转角度
N = 50; %段数
% Color = {[1,0.76,0.5],[0.34,0.63,0.98]}   %nature 橙蓝
 Color = {[0.47, 0.58, 0.64],[0.16, 0.30, 0.41]}      %蓝   
% Color = {[0.70, 0.80, 0.59],[0.42, 0.49, 0.33]}      %绿   
%Color = {[0.86, 0.85, 0.87],[0.53, 0.52, 0.54]}      %灰   

% 变量初始化
a0 = [0, 0, 0];
ax0 = plot3(a0(1), a0(2), a0(3));
axis equal
hold on;

theta = zeros(N, dtheta); %角度变量
x = zeros(N, dtheta); %x坐标
y = zeros(N, dtheta); %y坐标
z = zeros(N, dtheta); %z坐标
a = zeros(N, 3); %旋转轴方向
axHandle = cell(1, N); %旋转轴的指针
lnHandle = cell(1, N); %线段的指针

% 先把每一段线段画出来，不旋转
for i = 1:N
    theta(i, :) = linspace((i-1)*dtheta/180*pi, i*dtheta/180*pi, dtheta);
    x(i, :) = D/2*cos(theta(i, :));
    y(i, :) = D/2*sin(theta(i, :));
    a(i, :) = [cos(i*dtheta/180*pi+pi/2), sin(i*dtheta/180*pi+pi/2), 0];
    lnHandle{i} = plot3(x(i, :), y(i, :), z(i, :), '-','Color',Color{mod(i,2)+1},'linewidth',6.32);
    axHandle{i} = plot3(a(i, 1), a(i, 2), a(i, 3), 'Marker', 'none','linewidth',6.32);
end

% 依次旋转每一段线段，第一段转一次，第二段转两次，依此类推
for j = 2:N
    rotationAxis = [axHandle{j-1}.XData-ax0.XData, axHandle{j-1}.YData-ax0.YData, axHandle{j-1}.ZData-ax0.ZData];
    rotationPoint = [lnHandle{j-1}.XData(end), lnHandle{j-1}.YData(end), lnHandle{j-1}.ZData(end)];
    rotate(ax0, rotationAxis, turning, rotationPoint);
    for k = j:N
        rotate([lnHandle{k}, axHandle{k}], rotationAxis, turning, rotationPoint);
    end
end

% 保存旋转后的线段坐标
for k = 1:N
    x(k, :) = lnHandle{k}.XData;
    y(k, :) = lnHandle{k}.YData;
    z(k, :) = lnHandle{k}.ZData;
end
thetaData = reshape(theta', 1, []);
xData = reshape(x', 1, []);
yData = reshape(y', 1, []);
zData = reshape(z', 1, []);

% 将线段转为垂直于x-y平面
for k = 1:N
    rotate(lnHandle{k}, cross([0 0 1], [-8.093 4.671 -4.672]), -acos(dot([0 0 1], [-8.093 4.671 -4.672])/(norm([-8.093 4.671 -4.672])))/pi*180, [0 0 0]);
end

% %将线段平移
for k=1:N
    lnHandle{k}.XData = lnHandle{k}.XData-2.856;
    lnHandle{k}.YData = lnHandle{k}.YData-4.759;
    lnHandle{k}.ZData = lnHandle{k}.ZData+10.58;
end