function [customerPosition,distriCenterPosition,sendPostion,distriCenterConstantCost,distriCenterVolume,distriCenterManageCost,sendToDistriCenterPer,distriCenterToCustomerPer,customerRequirement] = DataFunction

% customerPosition = [13 40;18 25;36 33;30 15;44 7;25 80;30 60;53 68;62 80;78 69;
%                    63 48;83 50;59 22;89 23;21 50;40 52;55 39;48 83;78 33;78 21];             %�ͻ�λ�þ���
% distriCenterPosition = [38 78;65 55;22 31;43 24;64 29;32 50;59 72];  %��������λ�þ���
% sendPostion = [48 52];                                               %��������λ�þ��� 
% distriCenterConstantCost = [10 20 20 15 14 14 16];                    %�������Ĺ̶��ɱ�
% distriCenterVolume = [100 120 100 90 100 110 120]+1000;                   %���������������� 
% distriCenterManageCost = [5 6 4 4 5 4 6];                     %�������Ĺ���ɱ�
% sendToDistriCenterPer = rand([1,size(distriCenterPosition,1)])*0;    %�������ĵ��������ĵĵ�λ����ɱ�
% distriCenterToCustomerPer = rand([size(distriCenterPosition,1),size(customerPosition,1)])*0+1; %�������ĵ��ͻ���λ��������ɱ�
% customerRequirement = [16,17,17,19,16,23,23,19,19,18,23,18,16,22,19,17,19,16,17,23];  %�ͻ�������


customerPosition = [13 40;18 25;36 33;30 15;44 7;25 80;30 60;53 68;62 80;78 69;
                    63 48;83 50;59 22;89 23;21 50;40 52;55 39;48 83;78 33;78 21];            %�ͻ�λ�þ���
distriCenterPosition = [38 78;65 55;22 31;43 24;64 29;32 50;59 72];  %��������λ�þ���
sendPostion = [48 52];                                               %��������λ�þ��� 
distriCenterConstantCost = [10 20 20 15 14 14 16];                    %�������Ĺ̶��ɱ�
distriCenterVolume = [100 120 100 90 100 110 120]+1000;                   %���������������� 
distriCenterManageCost = [5 6 4 4 5 4 6];                     %�������Ĺ���ɱ�
sendToDistriCenterPer = rand([1,size(distriCenterPosition,1)])*0+1;    %�������ĵ��������ĵĵ�λ����ɱ�
distriCenterToCustomerPer = rand([size(distriCenterPosition,1),size(customerPosition,1)])*0+1; %�������ĵ��ͻ���λ��������ɱ�
customerRequirement = [16,17,17,19,16,23,23,19,19,18,23,18,16,22,19,17,19,16,17,23];  %�ͻ�������

