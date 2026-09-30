%{
        Lucas Rufkahr
        EE 2411, Lab 3
        9/21/2026
%}

clc;
clearvars;
close all;

%% Step 1 part a
x = -4:0.01:4;
y = -4:0.01:4;

%% Step 1 part b
[X, Y] = meshgrid(x,y);

%% Step 1 part c
Z = 2 * cos(X) - sin(Y.^2);

%% Step 1 part d.i
figure();
surf(X, Y, Z, EdgeColor='none');

%% Step 1 part d.ii
xlabel('x');
ylabel('y');
exportgraphics(gcf,'part2_step1.png');

%% Step 2 part a
imData = imread('office_6.jpg');

%% Step 2 part b
figure();
imshow(imData);

%% Step 2 part c.iv
figure();
imData1 = imData;
imData1(:,:,2) = 0;
imData1(:,:,3) = 0;
imshow(imData1);
exportgraphics(gcf, 'part2_step2_red.png');

%% Step 2 part c.v
figure();
imData2 = imData;
imData2(:,:,3) = 0;
imshow(imData2);
exportgraphics(gcf, 'part2_step2_yellow.png');

%% Step 2 part d
figure();
sliceImData = imread('office_6.jpg');
sliceImData = sliceImData(end*0.5:end,1:end*0.75,:);
imshow(sliceImData);
exportgraphics(gcf, 'part2_step2_crop.png');
%% Step 2 part e.i
figure();
imDataG = rgb2gray(imData);
imshow(imDataG)
exportgraphics(gcf, 'part2_step2_gray.png');

%% Step 2 part e.ii
imDataGSF = double(imDataG);

%% Step 2 part e.iii
oldMin = min(imDataGSF, [], 'all');
oldMax = max(imDataGSF, [], 'all');
newMin = 2 * min(imDataGSF,[],'all');
newMax = 0.5 * max(imDataGSF,[],'all');
imDataGSFScaled = uint8((imDataGSF - oldMin) .* (newMax - newMin)/(oldMax - oldMin) + newMin);
figure();
imshow(imDataGSFScaled);
exportgraphics(gcf, 'part2_step2_brightness.png');
