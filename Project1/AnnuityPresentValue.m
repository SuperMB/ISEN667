function [ presentValue ] = AnnuityPresentValue( payment, interestRate, numberOfPeriods)
    presentValue = payment*((((1 + interestRate)^numberOfPeriods) - 1)/(interestRate*((1 + interestRate)^numberOfPeriods)));
end

