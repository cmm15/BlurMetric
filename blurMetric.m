
% implementing this blur metric from this paper:
% The Blur Effect: Perception and Estimation with a New No-Reference
% Perceptual Blur Metric, Roffet et al 2008

% inputs:
%   F: 2D image in grayscale

% outputs:
%   blur_F: metric that measures how blurry the image F is

function blur_F = blurMetric(F)

% low pass filters 
hv = ones(1,9)/9;
hh = hv.';

% equation 1
Bver = conv2(F,hv,'same');
Bhor = conv2(F,hh,'same');

D_Fver = abs(diff(F,1,1));
D_Fhor = abs(diff(F,1,2));
D_Bver = abs(diff(Bver,1,1));
D_Bhor = abs(diff(Bhor,1,2));

Vver = max(0, D_Fver-D_Bver);
Vhor = max(0, D_Fhor-D_Bhor);

% paper implies this?
D_Vver = Vver;
D_Vhor = Vhor;

s_Fver = sum(D_Fver,'all');
s_Fhor = sum(D_Fhor,'all');
s_Vver = sum(D_Vver,'all');
s_Vhor = sum(D_Vhor,'all');

b_Fver = (s_Fver - s_Vver)/s_Fver;
b_Fhor = (s_Fhor - s_Vhor)/s_Fhor;

blur_F = max(b_Fver, b_Fhor);

% only use b_Fver of b_Fhor if want blur in once direction

end
