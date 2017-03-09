function [ negativePercent, positivePercent ] = AnalyzeIterations(iterations)
    
    negativeIterations = 0;
    for i = 1:length(iterations)
        if(iterations(i) < 0)
            negativeIterations = negativeIterations + 1;
        end
    end
    
    negativePercent = negativeIterations / length(iterations)
    positivePercent = 1 - negativePercent

end

