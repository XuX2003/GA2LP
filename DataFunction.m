function [customerPosition,distriCenterPosition,sendPostion,distriCenterConstantCost,distriCenterVolume,distriCenterManageCost,sendToDistriCenterPer,distriCenterToCustomerPer,customerRequirement] = DataFunction

% customerPosition = [13 40;18 25;36 33;30 15;44 7;25 80;30 60;53 68;62 80;78 69;
%                    63 48;83 50;59 22;89 23;21 50;40 52;55 39;48 83;78 33;78 21];             %客户位置矩阵
% distriCenterPosition = [38 78;65 55;22 31;43 24;64 29;32 50;59 72];  %配送中心位置矩阵
% sendPostion = [48 52];                                               %发件网点位置矩阵 
% distriCenterConstantCost = [10 20 20 15 14 14 16];                    %配送中心固定成本
% distriCenterVolume = [100 120 100 90 100 110 120]+1000;                   %配送中心容量矩阵 
% distriCenterManageCost = [5 6 4 4 5 4 6];                     %配送中心管理成本
% sendToDistriCenterPer = rand([1,size(distriCenterPosition,1)])*0;    %发件中心到配送中心的单位运输成本
% distriCenterToCustomerPer = rand([size(distriCenterPosition,1),size(customerPosition,1)])*0+1; %配送中心到客户单位距离运输成本
% customerRequirement = [16,17,17,19,16,23,23,19,19,18,23,18,16,22,19,17,19,16,17,23];  %客户需求量


customerPosition = [13 40;18 25;36 33;30 15;44 7;25 80;30 60;53 68;62 80;78 69;
                    63 48;83 50;59 22;89 23;21 50;40 52;55 39;48 83;78 33;78 21];            %客户位置矩阵
distriCenterPosition = [38 78;65 55;22 31;43 24;64 29;32 50;59 72];  %配送中心位置矩阵
sendPostion = [48 52];                                               %发件网点位置矩阵 
distriCenterConstantCost = [10 20 20 15 14 14 16];                    %配送中心固定成本
distriCenterVolume = [100 120 100 90 100 110 120]+1000;                   %配送中心容量矩阵 
distriCenterManageCost = [5 6 4 4 5 4 6];                     %配送中心管理成本
sendToDistriCenterPer = rand([1,size(distriCenterPosition,1)])*0+1;    %发件中心到配送中心的单位运输成本
distriCenterToCustomerPer = rand([size(distriCenterPosition,1),size(customerPosition,1)])*0+1; %配送中心到客户单位距离运输成本
customerRequirement = [16,17,17,19,16,23,23,19,19,18,23,18,16,22,19,17,19,16,17,23];  %客户需求量

