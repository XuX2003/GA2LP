%% ��ձ���
clear;
clc;

%% �û��Զ�������

[customerPosition,distriCenterPosition,sendPosition,distriCenterConstantCost,distriCenterVolume,...
 distriCenterManageCost,sendToDistriCenterPer,distriCenterToCustomerPer,customerRequirement] = DataFunction;
probabilityMat = [0.01,0.05,0.3,0.3,0.2,0.1,0.04];
% probabilityMat = ones(1,7)/7;
% probabilityMat = [0 0 0 1 0 0 0];

%% �û������޸�����
M = size(distriCenterPosition,1);  %�������ĵ���Ŀ
N = size(customerPosition,1);    %�ͻ�����Ŀ
if length(probabilityMat)~=M || abs(sum(probabilityMat)-1)>=1e-6
    error('����probabilityMat�Ĵ�С������������Ŀ��һ�»�probabilityMat�ӺͲ�Ϊ1');
end

%% �Ŵ��㷨����
populationNumber = 50;  %��Ⱥ����
pro = 0.1; %�������
populationMat = cell(populationNumber,4);  %��Ⱥ���ݾ���
iter = 1;  %��ǰ��������
iterMax = 1000;  % ����������
bestValue = inf;
bestValueNow = inf;
bestValueMat = zeros(populationNumber,1);
bestSolve = cell(1,4);

%% ��ʼ������
populationMat = InitializeIndividuality(populationMat,populationNumber,M,N,probabilityMat,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition);

while iter<=iterMax
    if iter<iterMax/2
        pro = 0.5;
    else
        pro = 0.05;
    end
    %% ������Ӧ��
    p = CalcuFitCapacity(populationMat,sendPosition,distriCenterPosition,sendToDistriCenterPer,customerPosition,distriCenterToCustomerPer,distriCenterConstantCost,distriCenterManageCost,populationNumber);
    
    %% ѡ��
    populationMat = SelectionFunction(populationMat,populationNumber,p);
    
    %% ����
    populationMat = CrossFunction(populationMat,populationNumber,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition,N);

    %% ����
    populationMat = HeteromorphosisFunction(populationMat,probabilityMat,pro,populationNumber,M,N,customerRequirement,distriCenterVolume,distriCenterPosition,customerPosition);

    %% Ѱ�����Ž�
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
%% ��ͼ
DrawPicture(bestSolve,distriCenterPosition,customerPosition,sendPosition)

%% ������ϵͼ
figure
plot(1:iterMax,bestValueMat,'r-','LineWidth',1);
xlabel('��������(��)')
ylabel('���ͷ���(��Ԫ)')
title('����������ÿ�����Ž��ϵͼ')
legend('ÿ�����Ž�')
grid on
%% ������
disp(['ѡȡ����������Ϊ:',num2str(bestSolve{1,2}),',�ܷ���Ϊ:',num2str(bestValue),'��Ԫ']);
numberMat = cumsum(bestSolve{1,3});
for k1 = 1:bestSolve{1,1}
    if k1 == 1
        disp(['��',num2str(bestSolve{1,2}(k1)),'���������Ķ�Ӧ�Ŀͻ�Ϊ:',num2str(bestSolve{1,4}(1:numberMat(k1)))]);
    else
        disp(['��',num2str(bestSolve{1,2}(k1)),'���������Ķ�Ӧ�Ŀͻ�Ϊ:',num2str(bestSolve{1,4}(numberMat(k1-1)+1:numberMat(k1)))]);
    end
end

