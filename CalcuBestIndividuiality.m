function [bestValue,bestSolve] = CalcuBestIndividuiality(populationMat,populationNumber,sendPosition,distriCenterPosition,sendToDistriCenterPer,customerPosition,distriCenterToCustomerPer,distriCenterConstantCost,distriCenterManageCost)

valueMat = zeros(populationNumber,1);
for k1 = 1:populationNumber
    valueMat(k1) = CalculateGoalFunctionValue(populationMat(k1,:),sendPosition,distriCenterPosition,sendToDistriCenterPer,customerPosition,distriCenterToCustomerPer,distriCenterConstantCost,distriCenterManageCost);
end
[bestValue,bestValueOrder] = min(valueMat);
bestSolve = populationMat(bestValueOrder,:);
    
% bestSolve = {4,[7 5 6 4],[4 7 5 4],[8 9 10 18 11 12 13 14 17 19 20 1 6 7 15 16 2 3 4 5]}