function cost = CalculateGoalFunctionValue(individuality,sendPosition,distriCenterPosition,sendToDistriCenterPer,customerPosition,distriCenterToCustomerPer,distriCenterConstantCost,distriCenterManageCost)

distriCenterNumber = individuality{1};
distriCenterSerial = individuality{2};
distriCenterDistri = individuality{3};
distriCenterDistriCumsum = cumsum(distriCenterDistri);
customerRandMat = individuality{4};

cost1 = 0;
cost2 = 0;
for k1 = 1:distriCenterNumber
    % ����1:�ӷ������ĵ��������ĵ��������
    disSendToCen = sqrt((sendPosition(1)-distriCenterPosition(distriCenterSerial(k1),1))^2+(sendPosition(2)-distriCenterPosition(distriCenterSerial(k1),2))^2);
    cost1 = disSendToCen*sendToDistriCenterPer(distriCenterSerial(k1))+cost1;
    
    %����2:���������ĵ��ͻ����������
    cost2Temp = 0;
    
    if k1 == 1
        customerMat = customerRandMat(1:distriCenterDistri(k1));
        for k2 = 1:length(customerMat)
            disDistriCenterToCustomer = CalcuDis(distriCenterPosition(distriCenterSerial(k1),:),customerPosition(customerMat(k2),:));
            cost2Temp = distriCenterToCustomerPer(distriCenterSerial(k1),customerMat(k2))*disDistriCenterToCustomer+cost2Temp;
        end
    else
        customerMat = customerRandMat(distriCenterDistriCumsum(k1-1)+1:distriCenterDistriCumsum(k1));
        for k2 = 1:length(customerMat)
            disDistriCenterToCustomer = CalcuDis(distriCenterPosition(distriCenterSerial(k1),:),customerPosition(customerMat(k2),:));
            cost2Temp = distriCenterToCustomerPer(distriCenterSerial(k1),customerMat(k2))*disDistriCenterToCustomer+cost2Temp;
        end
    end
    
    cost2 = cost2+cost2Temp;
    
end

%����3:�������Ĺ̶��ɱ�
cost3 = sum(distriCenterConstantCost(distriCenterSerial))+sum(distriCenterManageCost(distriCenterSerial));
% cost1
% cost2
% cost3
cost = cost1+cost2+cost3;


