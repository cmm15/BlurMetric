% test the blurMetric function
close all;clear;

% load in images
S = phantom(2^7);
P = double(rgb2gray(imread('peppers.png')));
F = double(rgb2gray(imread('mandrill.png')));

% blurry versions
S2 = imgaussfilt(S,5);
P2 = imgaussfilt(P,5);
F2 = imgaussfilt(F,5);

%calculate blur metrics
blurS = blurMetric(S);
blurS2 = blurMetric(S2);
blurP = blurMetric(P);
blurP2 = blurMetric(P2);
blurF = blurMetric(F);
blurF2 = blurMetric(F2);

% see results
figure;subplot(1,2,1)
imagesc(S);colormap gray;title('original');
xlabel(['blur_S = ' num2str(blurS)]);
subplot(1,2,2);
imagesc(S2);colormap gray;title('blurred');
xlabel(['blur_S_2 = ' num2str(blurS2)]);

figure;subplot(1,2,1)
imagesc(P);colormap gray;title('original');
xlabel(['blur_P = ' num2str(blurP)]);
subplot(1,2,2);
imagesc(P2);colormap gray;title('blurred');
xlabel(['blur_P_2 = ' num2str(blurP2)]);

figure;subplot(1,2,1)
imagesc(F);colormap gray;title('original');
xlabel(['blur_F = ' num2str(blurF)]);
subplot(1,2,2);
imagesc(F2);colormap gray;title('blurred');
xlabel(['blur_F_2 = ' num2str(blurF2)]);



