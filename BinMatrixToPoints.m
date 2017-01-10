function points = BinMatrixToPoints(binaryMatrix)

    [rowsMatrix,colMatrix] = size(binaryMatrix);

    k = 1;
    for i = 3:5:rowsMatrix-3
    for j = 3:5:colMatrix-3
      currentArray = binaryMatrix((i-2):(i+2),(j-2):(j+2)); 
      currentAmount = sum(currentArray(currentArray == 255));
      if (currentAmount > 2868.75)
         binaryMatrix((i-1):(i+1),(j-1):(j+1)) = 255; 
         points(k,1) = j;
         points(k,2) = i;
         k = k+1;
      end

    end
    end

    for i = 1:1:length(points)
    k = 1;
    for j = 1:1:length(points)
        pointDist = sqrt((points(i,1)-points(j,1))^2 + (points(i,2)-points(j,2))^2);
        if (pointDist ~= 0)
           curDist(k) = pointDist;
           k = k + 1;
        end 
    end
    points(i,3) = min(curDist);
    clear curDist
    end

    meanDist = mean(points(:,3));
    stdDist = std(points(:,3));
    posBorder = meanDist+2*stdDist;
    negBorder = meanDist-2*stdDist;

    incorrectIndexes = find(points(:,3) >= posBorder);
    points(incorrectIndexes,:) = [];
    incorrectIndexes = find(points(:,3) <= negBorder);
    points(incorrectIndexes,:) = [];

end

