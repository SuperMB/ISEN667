function [ presentValue ] = PresentValue( array, interestRate )
    numberOfYears = length(array);
    presentValue = 0;
    for i = 1:numberOfYears
        presentValue = presentValue + array(i)/((1 + interestRate)^(i-1));
    end
end

