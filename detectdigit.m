function [ prediction ] = detectdigit( data, finalB1L1, finalB1L2, finalSoftmaxTheta, finalW1L1, finalW1L2 )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    temp = (finalB1L1 + finalW1L1*data);
    layer1 = sigmoid(temp);
    layer2 = sigmoid(finalB1L2 + finalW1L2*layer1);
    output = sigmoid(finalSoftmaxTheta*layer2)'
    pause();
    %output = 1./(1 + exp(-finalSoftmaxTheta*layer2))
    [val, prediction] = max(output);
end

