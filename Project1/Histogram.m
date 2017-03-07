function [arrayHistogram, arrayChannels] = Histogram( array, numberOfChannels )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    minArray = min(array);
    maxArray = max(array);
    numberOfChannels = 20;
    arrayDifference = maxArray - minArray;
    arrayInterval = arrayDifference / numberOfChannels;
    arrayHistogram = zeros(numberOfChannels, 1);
    arrayChannels = zeros(numberOfChannels, 1);
    for i = 1:length(array)
        channel = ceil((array(i) - minArray) / arrayInterval);
        if(array(i) == minArray)
            channel = 1;
        end
        arrayHistogram(channel) = arrayHistogram(channel) + 1;
    end
    for i = 1:numberOfChannels
       arrayChannels(i) = minArray + (i-1)*arrayInterval; 
    end
    figure
    bar(arrayHistogram);
end

