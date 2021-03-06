function [ presentValue ] = AnnuityFutureValue( payment, interestRate, numberOfPeriods)
    presentValue = payment*((((1 + interestRate)^numberOfPeriods) - 1)/(interestRate));
end

