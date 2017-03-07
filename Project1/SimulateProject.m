function[ presentValue, projectYears, projectCost, annualSavings, salvageValue ] = SimulateProject()
    marr = .1;

    projectYears = 0;
    random = rand;
    if random < .6
        projectYears = 1;
    elseif random < .9
        projectYears = 2;
    else 
        projectYears = 3;
    end

    projectCost = -exprnd(500000);
    yearlyCost = projectCost/projectYears;
    cashFlows = zeros(1,projectYears);
    for i = 1:projectYears
        cashFlows(i) = yearlyCost;
    end

    cashFlows(projectYears + 1) = 0;

    totalYears = 10;
    savingsMin = 50000;
    savingsMax = 200000;
    for i = projectYears + 2:totalYears + 1
        annualSaving = rand*(savingsMax - savingsMin) + savingsMin;
        annualSavings(i - (projectYears + 1)) = annualSaving;
        cashFlows(i) = annualSaving;
    end

    salvageMean = 50000;
    salvageSigma = 20000;
    salvageValue = normrnd(salvageMean, salvageSigma);
    if(salvageValue < 0)
        salvageValue = 0;
    end

    cashFlows(length(cashFlows)) = cashFlows(length(cashFlows)) + salvageValue;

    presentValue = PresentValue(cashFlows, marr);
end