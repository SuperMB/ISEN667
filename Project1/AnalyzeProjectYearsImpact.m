function [ correlatedProjectValues ] = AnalyzeProjectYearsImpact( iterations, projectYears)
    
    correlatedProjectValues = zeros(3,1);
    currentLength = zeros(3,1);
    negativeIterations = zeros(3,1);
    positiveIterations = zeros(3,1);
    
    for i = 1:length(iterations)
        projectYear = projectYears(i);
        correlatedProjectValues(projectYear, currentLength(projectYear) + 1) = iterations(i);
        currentLength(projectYear) = currentLength(projectYear) + 1;
        if(iterations(i) < 0)
            negativeIterations(projectYear) = negativeIterations(projectYear) + 1;
        else
            positiveIterations(projectYear) = positiveIterations(projectYear) + 1;            
        end
    end
    
%     negativeIterations = zeros(3,1);
%     for i = 1:3
%         for j = 1:currentLength(i)
%             if(correlatedProjectValues(i,j) < 0)
%                negativeIterations(i) = negativeIterations(i) + 1;
%             end
%         end
%     end
    
    negativePercentages = zeros(3,1);
    positivePercentages = zeros(3,1);
    for i = 1:3
        negativePercentages(i) = negativeIterations(i) / currentLength(i);
        positivePercentages(i) = (currentLength(i) - negativeIterations(i)) / currentLength(i);
    end
    
    negativePercentages
    positivePercentages
    negativeIterations
    positiveIterations
end
