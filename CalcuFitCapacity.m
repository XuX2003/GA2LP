function p = CalcuFitCapacity(populationMat,sendPosition,distriCenterPosition,sendToDistriCenterPer,customerPosition,distriCenterToCustomerPer,distriCenterConstantCost,distriCenterManageCost,populationNumber)

value = zeros(populationNumber,1);
for k1 = 1:populationNumber
    value(k1) = CalculateGoalFunctionValue(populationMat(k1,:),sendPosition,distriCenterPosition,sendToDistriCenterPer,customerPosition,distriCenterToCustomerPer,distriCenterConstantCost,distriCenterManageCost);
end
value = value/sum(value);
value = 1./value;
value = value';
p = value/sum(value);

