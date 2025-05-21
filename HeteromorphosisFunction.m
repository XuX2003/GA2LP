function populationMat = HeteromorphosisFunction(populationMat,probabilityMat,pro,populationNumber,M,N,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition)
for k1 = 1:populationNumber
    if rand<pro
        % ���ɵ�һ����
        number = SelectValue(probabilityMat);      
        % ���ɵڶ�����
        temp2 = randperm(M);
        orderMat = temp2(1:number);       
        % ���ɵ�������
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
        %���ɵ��ĸ���
        customerMat = CreateFourthSolve(number,orderMat,numberMat,distriCenterPosition,customerPosition,N);  
        %ƴ���¸���
        newIndividuality = {number,orderMat,numberMat,customerMat};       
        % �жϽ��Ƿ�����Լ������
        if ConstraintFunction(newIndividuality,customerRequirement,distriCenterVolume)
            populationMat(k1,:) = newIndividuality;
        end
    end
      
end