clear; clc;
load NN.mat;
load testSet.mat;

% show the 1st sample
% imshow(reshape(testData(:,1),28,28));


% Part A
% Compute the number of all connections between different nodes in the network.
% Input Nodes: 784
% Layer 1: 200
% Layer 2: 200
% Output:  10

connections = 784*200 + 200*200 + 200*10;
disp('Number of connections = ');
disp(connections);


% Part B
% With IEEE 754 double precision:
disp('Required memory for double precision in MB');
% 64 bit
doublemem = connections * 64; % in bits
doublemem = doublemem/8; % bytes
doublemem = doublemem/(2^20); % megabytes
disp(doublemem);

disp('Required memory for single precision in MB');
% 32 bit
disp(doublemem/2);

correct = 0;
prediction = zeros(1,10000);
for i = [1:10000]
   % showdigit(i,testData); 
   prediction(i) = detectdigit( testData(:,i), finalB1L1, finalB1L2, finalSoftmaxTheta, finalW1L1, finalW1L2 );
   if(prediction(i) == testLabels(i))
       correct = correct + 1;
   else
       showdigit(i,testData);
       prediction(i)
       pause();
   end
end

accuracy = correct/10000

