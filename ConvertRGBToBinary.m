function img = ConvertRGBToBinary(workImage,colorCoords)

    redBand = workImage(:,:,1);
    greenBand = workImage(:,:,2);
    blueBand = workImage(:,:,3);

    redValue = redBand(colorCoords(2),colorCoords(1));
    greenValue = greenBand(colorCoords(2),colorCoords(1));
    blueValue = blueBand(colorCoords(2),colorCoords(1));

    redBand(redBand~=redValue) = 0;
    greenBand(greenBand~=greenValue) = 0;
    blueBand(blueBand~=blueValue) = 0;

    redBand(redBand==redValue) = 255;
    greenBand(greenBand==greenValue) = 255;
    blueBand(blueBand==blueValue) = 255;

    img = (redBand + greenBand + blueBand)/3;
    img(img ~= 255) = 0;

end

