function populationMat = CrossFunction(populationMat,populationNumber,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition,N)
for k1 = 1:2:populationNumber-1
    orderMat1 = populationMat{k1,2};
    orderMat2 = populationMat{k1+1,2};
    mixOrderMat = [orderMat1 orderMat2];
    mixOrderMat = mixOrderMat(randperm(length(mixOrderMat)));
    mat = unique(mixOrderMat,'stable');
    newOrderMat1 = mat(1:length(orderMat1));
    mat = mat(randperm(length(mat)));
    newOrderMat2 = mat(1:length(orderMat2));
    %配送中心配送个数交叉（自交）
    if rand<0.3
        numberMat1 = populationMat{k1,3};
        newNumberMat1 = numberMat1(randperm(length(numberMat1)));
        numberMat2 = populationMat{k1+1,3};
        newNumberMat2 = numberMat2(randperm(length(numberMat2)));
    else    
        newNumberMat1 = populationMat{k1,3};
        newNumberMat2 = populationMat{k1+1,3};
    end
    %客户序号
    customer1 = CreateFourthSolve(length(newOrderMat1),newOrderMat1,newNumberMat1,distriCenterPosition,customerPosition,N);
    customer2 = CreateFourthSolve(length(newOrderMat2),newOrderMat2,newNumberMat2,distriCenterPosition,customerPosition,N); 
    %拼接新个体
    newIndividuality1 = {populationMat{k1,1},newOrderMat1,newNumberMat1,customer1};
    newIndividuality2 = {populationMat{k1+1,1},newOrderMat2,newNumberMat2,customer2}; 
    if ConstraintFunction(newIndividuality1,customerRequirement,distriCenterVolume)
        populationMat(k1,:) = newIndividuality1;
    end
    if ConstraintFunction(newIndividuality2,customerRequirement,distriCenterVolume)
        populationMat(k1+1,:) = newIndividuality2;
    end
    
end