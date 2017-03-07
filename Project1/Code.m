clear

numberOfIterartions = 10000;
iterations = zeros(1,numberOfIterartions);
sum = 0;

projectYearsHistogram = zeros(1,3);
projectCosts = zeros(1,numberOfIterartions);
salvageValues = zeros(1,numberOfIterartions);

for i = 1:numberOfIterartions
    [iterations(i) projectYears projectCosts(i) currentAnnualSavings salvageValues(i)] = SimulateProject(); 
    projectYearsHistogram(projectYears) = projectYearsHistogram(projectYears) + 1;
    sum = sum + iterations(i);
    
    for j = 1:length(currentAnnualSavings)
        
        if(exist('annualSavings','var') == 1)
            annualSavings(length(annualSavings) + 1) = currentAnnualSavings(j);
        else
            annualSavings(1) = currentAnnualSavings(j);
        end
    end
end

bar(projectYearsHistogram);
xlabel('Project Years');
ylabel('Number of Iterations');
title('Number of Years for Project Bar Graph');

Histogram(projectCosts, 20);
[annualSavingsHistogram annualSavingsChannels] = Histogram(annualSavings, 50);
Histogram(salvageValues, 50);


average = sum / numberOfIterartions;
numberOfPositiveSimulations = 0;
numberOfNegativeSimulations = 0;
for i = 1:numberOfIterartions
   if(iterations(i) < 0)
       numberOfNegativeSimulations = numberOfNegativeSimulations + 1;
   else
       numberOfPositiveSimulations = numberOfPositiveSimulations + 1;
   end
end
numberOfPositiveSimulations
numberOfNegativeSimulations
average