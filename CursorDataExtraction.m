function [colorCoords,scaleLineCoords,realDistance] = CursorDataExtraction(workImage)

fig = figure;
axis equal
imshow(workImage);
for i = 1:1:3
    shg
    if (i == 1)
        title('Select color of the object of interest','FontSize',18,'FontWeight','bold','Color','k');
    elseif (i == 2)
        title('Select start point for the scale line','FontSize',18,'FontWeight','bold','Color','k');
    elseif (i == 3)
        title('Select end point for the scale line','FontSize',18,'FontWeight','bold','Color','k');
    end
    
    dcm_obj = datacursormode(1);
    set(dcm_obj,'DisplayStyle','window',...
      'SnapToDataVertex','off','Enable','on')
    waitforbuttonpress
    c_info{i,1} = getCursorInfo(dcm_obj);
end

for i = 1:1:3
	positions{i,1} = c_info{i,1}.Position;
end

[imgHeight,imgWidth,~] = size(workImage);
reset(fig)
hold on
axis off
axis equal
image([0,imgWidth],[0,imgHeight],workImage);

colorCoords = positions{1};
scaleLineCoords = [positions{2};positions{3}];

plot(scaleLineCoords(:,1),scaleLineCoords(:,2),'LineWidth',4,'Color','r');
plot(scaleLineCoords(:,1),scaleLineCoords(:,2),'LineWidth',2,'Color','w');

prompt = {'Enter scale line`s real distance:'};
dlgTitle = 'Scale';
numLines = 1;
defaultValues = {'Input distance in KM'};
inputData = inputdlg(prompt,dlgTitle,numLines,defaultValues);
realDistance = str2num(inputData{1});

close all


end

