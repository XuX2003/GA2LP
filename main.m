%% 清空变量
clear;
clc;

%% 用户自定义数据

[customerPosition,distriCenterPosition,sendPosition,distriCenterConstantCost,distriCenterVolume,...
 distriCenterManageCost,sendToDistriCenterPer,distriCenterToCustomerPer,customerRequirement] = DataFunction;
probabilityMat = [0.01,0.05,0.3,0.3,0.2,0.1,0.04];
% probabilityMat = ones(1,7)/7;
% probabilityMat = [0 0 0 1 0 0 0];

%% 用户不可修改数据
M = size(distriCenterPosition,1);  %配送中心的数目
N = size(customerPosition,1);    %客户的数目
if length(probabilityMat)~=M || abs(sum(probabilityMat)-1)>=1e-6
    error('参数probabilityMat的大小与配送中心数目不一致或probabilityMat加和不为1');
end

%% 遗传算法数据
populationNumber = 50;  %种群数量
pro = 0.1; %变异概率
populationMat = cell(populationNumber,4);  %种群数据矩阵
iter = 1;  %当前迭代次数
iterMax = 1000;  % 最大迭代次数
bestValue = inf;
bestValueNow = inf;
bestValueMat = zeros(populationNumber,1);
bestSolve = cell(1,4);

%% 初始化个体
populationMat = InitializeIndividuality(populationMat,populationNumber,M,N,probabilityMat,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition);

while iter<=iterMax
    if iter<iterMax/2
        pro = 0.5;
    else
        pro = 0.05;
    end
    %% 计算适应度
    p = CalcuFitCapacity(populationMat,sendPosition,distriCenterPosition,sendToDistriCenterPer,customerPosition,distriCenterToCustomerPer,distriCenterConstantCost,distriCenterManageCost,populationNumber);
    
    %% 选择
    populationMat = SelectionFunction(populationMat,populationNumber,p);
    
    %% 交叉
    populationMat = CrossFunction(populationMat,populationNumber,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition,N);

    %% 变异
    populationMat = HeteromorphosisFunction(populationMat,probabilityMat,pro,populationNumber,M,N,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition);

    %% 寻找最优解
    [bestValueNow,bestSolveNow] = CalcuBestIndividuiality(populationMat,populationNumber,sendPosition,distriCenterPosition,sendToDistriCenterPer,customerPosition,distriCenterToCustomerPer,distriCenterConstantCost,distriCenterManageCost);
    
    if bestValueNow<bestValue
        bestValueMat(iter) = bestValueNow;
        bestValue = bestValueNow;
        bestSolve = bestSolveNow;
    else
        bestValueMat(iter) = bestValue;
    end
    iter = iter+1;
end
%% 画图
DrawPicture(bestSolve,distriCenterPosition,customerPosition,sendPosition)

%% 迭代关系图
figure
plot(1:iterMax,bestValueMat,'r-','LineWidth',1);
xlabel('迭代次数(代)')
ylabel('配送费用(万元)')
title('迭代次数与每代最优解关系图')
legend('每代最优解')
grid on
%% 输出结果
disp(['选取的配送中心为:',num2str(bestSolve{1,2}),',总费用为:',num2str(bestValue),'万元']);
numberMat = cumsum(bestSolve{1,3});
for k1 = 1:bestSolve{1,1}
    if k1 == 1
        disp(['第',num2str(bestSolve{1,2}(k1)),'个配送中心对应的客户为:',num2str(bestSolve{1,4}(1:numberMat(k1)))]);
    else
        disp(['第',num2str(bestSolve{1,2}(k1)),'个配送中心对应的客户为:',num2str(bestSolve{1,4}(numberMat(k1-1)+1:numberMat(k1)))]);
    end
end

