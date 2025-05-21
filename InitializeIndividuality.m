function populationMat = InitializeIndividuality(populationMat,populationNumber,M,N,probabilityMat,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition)

countNumber = 1;

while countNumber<=populationNumber
    % 生成第一个解
    temp1 = SelectValue(probabilityMat);
    populationMat{countNumber,1} = temp1;
    
    % 生成第二个解
    temp2 = randperm(M);
    populationMat{countNumber,2} = temp2(1:temp1);
    
    % 生成第三个解
    start = 1;
    tempMat = zeros(1,temp1);
    addValue = 0;
    while start<=temp1
        if start==temp1
            tempMat(start) = N-addValue;
            break;
        end
        tempMat(start) = randi(N-(temp1-start)-addValue);
        addValue = round(sum(tempMat));
        
        start = start+1;
    end
    populationMat{countNumber,3} = tempMat;
    
    %生成第四个解
    populationMat{countNumber,4} = CreateFourthSolve(temp1,temp2(1:temp1),tempMat,distriCenterPosition,customerPosition,N);
    
    % 判断解是否满足约束条件
    if ConstraintFunction(populationMat(countNumber,:),customerRequirement,distriCenterVolume)
        countNumber = countNumber+1;
    end
    
end
    
    