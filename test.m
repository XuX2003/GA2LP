fajian = [48 52];
peisong = [38 78;65 55;22 31;43 24;64 29;32 50;59 72];
kehu = [13 40;18 25;36 33;30 15;44 7;25 80;30 60;53 68;62 80;78 69;63 48;83 50;59 22;89 23;21 50;40 52;55 39;48 83;78 33];

offset = 1;
plot(fajian(1),fajian(2),'ms','LineWidth',2,'MarkerSize',10,'MarkerEdgeColor','g','MarkerFaceColor','m');
text(fajian(1)+offset,fajian(2)+offset,'·¢¼þµã','Color','m');
hold on;
for k1 = 1:length(peisong)
    plot(peisong(k1,1),peisong(k1,2),'bo','MarkerEdgeColor',[0 .5 .5],...
              'MarkerFaceColor',[0 .7 .7],...
              'LineWidth',1.5);
    text(peisong(k1,1)+offset,peisong(k1,2)+offset,['P',num2str(k1)],'Color','red');
end
for k2 = 1:length(kehu)
    plot(kehu(k2,1),kehu(k2,2),'bp');
    text(kehu(k2,1)+offset,kehu(k2,2)+offset,num2str(k2),'Color','blue');
end
% plot(kehu(:,1),kehu(:,2),'gp')
% plot(ans(:,1),ans(:,2),'gp')
axis([0 100 0 100])


a = [22 31];
b = [44 7;30 60;13 40;36 33;30 15;18 25;25 80;62 80; 63 48;78 69;53 68;83 50];
for i = 1:7
    aa(i) = calcuDis(a,b(i,:));
end
for i = 1:5
    bb(i) = calcuDis([65 55],b(i+7,:));
end

   33.4215
   17.2627