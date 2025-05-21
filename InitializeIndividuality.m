function populationMat = InitializeIndividuality(populationMat,populationNumber,M,N,probabilityMat,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition)

countNumber = 1;

while countNumber<=populationNumber
    % ���ɵ�һ����
    temp1 = SelectValue(probabilityMat);
    populationMat{countNumber,1} = temp1;
    
    % ���ɵڶ�����
    temp2 = randperm(M);
    populationMat{countNumber,2} = temp2(1:temp1);
    
    % ���ɵ�������
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
    
    %���ɵ��ĸ���
    populationMat{countNumber,4} = CreateFourthSolve(temp1,temp2(1:temp1),tempMat,distriCenterPosition,customerPosition,N);
    
    % �жϽ��Ƿ�����Լ������
    if ConstraintFunction(populationMat(countNumber,:),customerRequirement,distriCenterVolume)
        countNumber = countNumber+1;
    end
    
end
    
    