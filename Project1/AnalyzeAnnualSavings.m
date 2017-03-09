function [ savingsSortedByIterations, everyTenth, replicated] = AnalyzeAnnualSavings( iterations, allSavings )
    
    savingsSortedByIterations = allSavings;
    for i = 1:length(allSavings(:,1))
        savingsSortedByIterations(i,1) = iterations(i);
    end
    
    savingsSortedByIterations = sortrows(savingsSortedByIterations);   

    everyTenth = zeros(length(savingsSortedByIterations(:,1))/10, 10);
    for i = 1:length(everyTenth(:,1))
        everyTenth(i,:) = savingsSortedByIterations((i-1)*10 + 1,:);
    end

    replicate = 25;
    replicated = zeros(length(savingsSortedByIterations(:,1)),9*replicate + 1);
    for i = 1:length(savingsSortedByIterations(:,1))
        replicated(i,1) = savingsSortedByIterations(i,1);
        for j = 2:length(savingsSortedByIterations(i,:))
            for k = 1:replicate
                replicated(i,(j-2)*replicate + k + 1) = savingsSortedByIterations(i,j);
            end
        end
    end
    
end

