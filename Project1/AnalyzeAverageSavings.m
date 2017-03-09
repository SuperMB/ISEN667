function [ averageAnnualSavingsAnalyzed, firstAnnualSavingsAnalyzed ] = AnalyzeAverageSavings( iterations, averageAnnualSavings, firstAnnualSavings)
    
    iterationsTranspose = iterations.';
    averageAnnualSavingsTranspose = averageAnnualSavings.';
    combined(:,1) = averageAnnualSavingsTranspose;
    combined(:,2) = iterationsTranspose;
    averageAnnualSavingsAnalyzed = sortrows(combined);
    figure();
    plot(averageAnnualSavingsAnalyzed(:,1), averageAnnualSavingsAnalyzed(:,2));
    
    firstAnnualSavingsTranspose = firstAnnualSavings.';
    combined(:,1) = firstAnnualSavingsTranspose;
    firstAnnualSavingsAnalyzed = sortrows(combined);
    figure();
    plot(firstAnnualSavingsAnalyzed);

    combined(:,1) = iterationsTranspose;
    combined(:,2) = averageAnnualSavingsTranspose;
    combined(:,3) = firstAnnualSavingsTranspose;
    iterationsFirst = sortrows(combined);
    figure();
    plot(iterationsFirst);
    
    position = 1;
    projectsLessThan0 = 0;
    while(iterationsFirst(position,1) < 0)
        position = position + 1;
        projectsLessThan0 = projectsLessThan0 + 1;
    end
    firstPositiveIteration = iterationsFirst(position)
    negativePercentage = projectsLessThan0 / length(iterations)
    positivePercentage = (length(iterations) - projectsLessThan0) / length(iterations)
end

