function AutoCADScriptMaker(transBoundary,fileName)

    fileID = fopen([fileName,'.scr'],'w');
    fprintf(fileID,'PLINE\r\n');
    for i = 1:1:length(transBoundary(:,1))
        fprintf(fileID,'%.6f,%.6f\r\n',transBoundary(i,1),transBoundary(i,2));
    end
    fprintf(fileID,'C\r\n');
    fprintf(fileID,'ZOOM E\r\n');
    fclose(fileID);

end

