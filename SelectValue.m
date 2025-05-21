function number = SelectValue(probabilityMat)
mat = cumsum(probabilityMat);
mat = [0 mat];
randNum = rand;
for k1 = 1:length(mat)
    if randNum<mat(k1)
        number = k1-1;
        return;
    end
end