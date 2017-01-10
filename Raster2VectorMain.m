clear;
clc;

fileDir = uigetfile({'*.jpg';'*.jpeg'},'Open image file');
[~,fileName,~] = fileparts(fileDir);
mainImage = imread(fileDir);
workImage = ImageIndexing(mainImage);

[colorCoords,scaleLineCoords,realDistance] = CursorDataExtraction(workImage);
binMatrix = ConvertRGBToBinary(workImage,colorCoords);
pixelPoints = BinMatrixToPoints(binMatrix);

objBoundary = ExtractBoundary(pixelPoints);
transBoundary = TransformBoundary(objBoundary,scaleLineCoords,realDistance,workImage);

AutoCADScriptMaker(transBoundary,fileName);

fig = figure;
hold on
axis equal
axis off
plot(transBoundary(:,1),transBoundary(:,2))
hold off

clc;
disp('Computation successful!')
disp('Results are printed in folder Results')