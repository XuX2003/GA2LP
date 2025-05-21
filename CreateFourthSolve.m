function fourthSolve = CreateFourthSolve(number,orderMat,numberMat,distriCenterPosition,customerPosition,N)
customerLeave = 1:N;
fourthSolve = zeros(1,N);
index = 0;
for k1 = 1:number
    disMat = zeros(1,length(customerLeave));
    for k2 = 1:length(customerLeave)
        dis = CalcuDis(distriCenterPosition(orderMat(k1),:),customerPosition(customerLeave(k2),:));
        disMat(k2) = dis;
    end
        disMat = disMat.^3;
        disMat = 1./disMat;
        disMat = disMat/sum(disMat);
    for k3 = 1:numberMat(k1)
        index = index+1;
        number1 = SelectValue(disMat);
        fourthSolve(index) = customerLeave(number1);
        customerLeave(number1) = [];
        disMat(number1) = [];
        disMat = disMat./sum(disMat);
    end
end
        
        
    
        
