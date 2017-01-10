function objBoundary = ExtractBoundary(points)

indexes = boundary(points(:,1),points(:,2),1);
objBoundary = points(indexes,:);

end

