function flag = ConstraintFunction(individuality,customerRequirement,distriCenterVolume)

distriCenterNumber = individuality{1};
distriCenterSerial = individuality{2};
distriCenterDistri = individuality{3};
distriCenterDistri = cumsum(distriCenterDistri);
customerRandMat = individuality{4};

flag_1 = true;

flag = false;


% 第一个约束函数
for k1 = 1:distriCenterNumber
    if k1 == 1
        if ~(sum(customerRequirement(customerRandMat(1:distriCenterDistri(k1))))<=distriCenterVolume(distriCenterSerial(k1)))
            flag_1 = false;
        end
    else
        if  ~(sum(customerRequirement(customerRandMat(distriCenterDistri(k1-1)+1:distriCenterDistri(k1))))<=distriCenterVolume(distriCenterSerial(k1)))
            flag_1 = false;
        end
    end
end

if flag_1
    flag = true;
end
            
            
            
        
