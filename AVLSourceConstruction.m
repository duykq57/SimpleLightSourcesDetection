C = 0:2.5:357.5; % C angle
gamma = 0:2.5:80; % gamma angle
h = 12.5;
load('data.mat');
v1 = b(1:33,:);
v2 = flipdim(v1,2);
v3 = [v1,v2(:,2:72)];
v = v3;
[a,b]= meshgrid(C,gamma);

xC = a(:);
xC = xC';

yGamma = b(:);
yGamma = yGamma';

r = h*tand(yGamma);

yReal = r.*sind(xC);
xReal = r.*cosd(xC);

value = v(:);
value = (value').*cosd(yGamma);

d = -50:0.1:50;
[xq,yq] = meshgrid(d,d);
F = scatteredInterpolant(xReal',yReal',value');

% vq = griddata(xReal,yReal,value,xq,yq,'natural');
% contourf(xq,yq,vq);

% surf(xq,yq,vq);
% shading interp
% F = TriScatteredInterp(x,y,v);
