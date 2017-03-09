function[ presentValue, projectYears, projectCost, annualSavings, salvageValue ] = SimulateProject(marr)
    totalYears = 10;

    varryNumberOfYears = false;
    varryProjectCost = false;
    varryAnnualSavings = true;
    varrySalvageValue = false;
    
    projectYears = 1;
    if(varryNumberOfYears) 
        random = rand;
        if random < .6
            projectYears = 1;
        elseif random < .9
            projectYears = 2;
        else 
            projectYears = 3;
        end
    end

    projectCost = -500000;
    if(varryProjectCost)
        projectCost = -exprnd(500000);
    end
    
    yearlyCost = projectCost/projectYears;
    cashFlows = zeros(1,totalYears);
    for i = 1:projectYears
        cashFlows(i) = yearlyCost;
    end

    cashFlows(projectYears + 1) = 0;

    savingsMin = 50000;
    savingsMax = 200000;
    for i = projectYears + 2:totalYears + 1
        if(varryAnnualSavings)
            annualSaving = rand*(savingsMax - savingsMin) + savingsMin;
        else
            annualSaving = 125000;
        end
        annualSavings(i - (projectYears + 1)) = annualSaving;
        cashFlows(i) = annualSaving;
    end

    salvageValue = 50000;
    if(varrySalvageValue)
        salvageMean = 50000;
        salvageSigma = 20000;
        salvageValue = normrnd(salvageMean, salvageSigma);
        if(salvageValue < 0)
            salvageValue = 0;
        end
    end
    
    cashFlows(length(cashFlows)) = cashFlows(length(cashFlows)) + salvageValue;

    presentValue = PresentValue(cashFlows, marr);
end