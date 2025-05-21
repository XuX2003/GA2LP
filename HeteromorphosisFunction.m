function populationMat = HeteromorphosisFunction(populationMat,probabilityMat,pro,populationNumber,M,N,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition)
for k1 = 1:populationNumber
    if rand<pro
        % 生成第一个解
        number = SelectValue(probabilityMat);      
        % 生成第二个解
        temp2 = randperm(M);
        orderMat = temp2(1:number);       
        % 生成第三个解
        start = 1;
        tempMat = zeros(1,number);
        addValue = 0;
        while start<=number
            if start==number
                tempMat(start) = N-addValue;
                break;
            end
            tempMat(start) = randi(N-(number-start)-addValue);
            addValue = round(sum(tempMat));
            
            start = start+1;
        end
        numberMat = tempMat;   
        %生成第四个解
        customerMat = CreateFourthSolve(number,orderMat,numberMat,distriCenterPosition,customerPosition,N);  
        %拼接新个体
        newIndividuality = {number,orderMat,numberMat,customerMat};       
        % 判断解是否满足约束条件
        if ConstraintFunction(newIndividuality,customerRequirement,distriCenterVolume)
            populationMat(k1,:) = newIndividuality;
        end
    end
      
end