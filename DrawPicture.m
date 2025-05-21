function DrawPicture(bestSolve,distriCenterPosition,customerPosition,sendPosition)

%% 解析数据
distriCenterNumber = bestSolve{1};
distriCenterSerial = bestSolve{2};
distriCenterDistri = bestSolve{3};
distriCenterDistriCumsum = cumsum(distriCenterDistri);
customerRandMat = bestSolve{4};
offset = 1;
%% 画发件网点
p1 = plot(sendPosition(1),sendPosition(2),'ms','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','g','MarkerFaceColor','m');
text(sendPosition(1)+offset,sendPosition(2)+offset,'发件点','Color','m');
hold on;
%% 画配送中心
 p2 = plot(distriCenterPosition(:,1),distriCenterPosition(:,2),'bo','MarkerEdgeColor',[0 .5 .5],...
        'MarkerFaceColor',[0 .7 .7],...
        'LineWidth',1.5);
for k1 = 1:length(distriCenterPosition)
    text(distriCenterPosition(k1,1)+offset,distriCenterPosition(k1,2)+offset,['P',num2str(k1)],'Color','red');
end
%% 画客户坐标点
p3 = plot(customerPosition(:,1),customerPosition(:,2),'bp');
for k2 = 1:length(customerPosition)
    text(customerPosition(k2,1)+offset,customerPosition(k2,2)+offset,num2str(k2),'Color','blue');
end
for k3 = 1:distriCenterNumber
    color = [rand rand rand];
    if k3 == 1
        for k4 = 1:distriCenterDistri(k3)
            plot([distriCenterPosition(distriCenterSerial(k3),1)  customerPosition(customerRandMat(k4),1)],...
                [distriCenterPosition(distriCenterSerial(k3),2) customerPosition(customerRandMat(k4),2)],'-','Color',color,'LineWidth',1);
        end
    else
        for k4 = 1:distriCenterDistri(k3)
            plot([distriCenterPosition(distriCenterSerial(k3),1)  customerPosition(customerRandMat(k4+distriCenterDistriCumsum(k3-1)),1)],...
                [distriCenterPosition(distriCenterSerial(k3),2) customerPosition(customerRandMat(k4+distriCenterDistriCumsum(k3-1)),2)],'-','Color',color','LineWidth',1);
        end
    end
end
legend([p1 p2 p3],{'发件中心','配送中心','客户坐标点'})
xlabel('客户x轴坐标(km)')
ylabel('客户y轴坐标(km)')
title('求解关系图')
axis([0 100 0 100])


