clear
Source

marr = .1;
unchangedCashFlows = [ -500000 0 125000 125000 125000 125000 125000 125000 125000 125000 175000]
initialPresentWorth = PresentValue(unchangedCashFlows, marr);

numberOfIterations = 500;
iterations = zeros(1,numberOfIterations);
sum = 0;

projectYearsHistogram = zeros(1,3);
projectYears = zeros(1,numberOfIterations);
projectCosts = zeros(1,numberOfIterations);
averageAnnualSavings = zeros(1,numberOfIterations);
firstAnnualSavings = zeros(1,numberOfIterations);
salvageValues = zeros(1,numberOfIterations);
allAnnualSavings = zeros(numberOfIterations, 10);

for i = 1:numberOfIterations
    [iterations(i), projectYears(i), projectCosts(i), currentAnnualSavings, salvageValues(i)] = SimulateProject(marr); 
    firstAnnualSavings(i) = currentAnnualSavings(1);
    projectYearsHistogram(projectYears(i)) = projectYearsHistogram(projectYears(i)) + 1;
    sum = sum + iterations(i);
    
    averageAnnualSaving = 0;
    for j = 1:length(currentAnnualSavings)
        averageAnnualSaving = averageAnnualSaving + currentAnnualSavings(j);
        
        if(exist('annualSavings','var') == 1)
            annualSavings(length(annualSavings) + 1) = currentAnnualSavings(j);
        else
            annualSavings(1) = currentAnnualSavings(j);
        end
    end
    averageAnnualSavings(i) = averageAnnualSaving / length(currentAnnualSavings);
    
    for j = 1:10 - length(currentAnnualSavings)
       allAnnualSavings(i,j) = 0; 
    end
    for j = 10 - length(currentAnnualSavings) + 1:10
       allAnnualSavings(i,j) = currentAnnualSavings(j - (10 - length(currentAnnualSavings)));         
    end
end

bar(projectYearsHistogram);
xlabel('Project Years');
ylabel('Number of Iterations');
title('Number of Years for Project Bar Graph');

Histogram(projectCosts, 20);
[annualSavingsHistogram, annualSavingsChannels] = Histogram(annualSavings, 50);
Histogram(salvageValues, 50);

average = sum / numberOfIterations;
numberOfPositiveSimulations = 0;
numberOfNegativeSimulations = 0;
for i = 1:numberOfIterations
   if(iterations(i) < 0)
       numberOfNegativeSimulations = numberOfNegativeSimulations + 1;
   else
       numberOfPositiveSimulations = numberOfPositiveSimulations + 1;
   end
end
numberOfPositiveSimulations
numberOfNegativeSimulations
average