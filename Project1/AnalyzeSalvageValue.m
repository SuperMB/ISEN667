function [ salvageValuesAnalyzed ] = AnalyzeSalvageValue( iterations, salvageValues )
    
    iterationsTranspose = iterations.';
    salvageValuesTranspose = salvageValues.';
    combined(:,1) = salvageValuesTranspose;
    combined(:,2) = iterationsTranspose;
    salvageValuesAnalyzed = sortrows(combined);
    
    figure();
    plot(salvageValuesAnalyzed(:,1), salvageValuesAnalyzed(:,2));
    
end

