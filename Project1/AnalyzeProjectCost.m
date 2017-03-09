function [ projectCostsAnalyzed] = AnalyzeProjectCost( iterations, projectCosts )

    iterationsTranspose = iterations.';
    projectCostsTranspose = projectCosts.';
    combined(:,1) = projectCostsTranspose;
    combined(:,2) = iterationsTranspose;
    projectCostsAnalyzed = sortrows(combined);
    
%     position = 1;
%     projectsLessThan0 = 0;
%     while(projectCostsAnalyzed(position,2) < 0)
%         position = position + 1;
%         projectsLessThan0 = projectsLessThan0 + 1;
%     end
%     firstPositiveProjectCost = projectCostsAnalyzed(position,1)
%     firstPositiveProjectValue = projectCostsAnalyzed(position,2)

    plot(projectCostsAnalyzed(:,1), projectCostsAnalyzed(:,2));
    
%     negativePercentage = projectsLessThan0 / length(iterations)
%     positivePercentage = (length(iterations) - projectsLessThan0) / length(iterations)
    
end

