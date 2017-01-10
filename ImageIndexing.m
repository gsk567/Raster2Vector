function img = ImageIndexing(inputImage)

    [X,map] = rgb2ind(inputImage,8,'nodither');
    img = ind2rgb(X,map);

end

