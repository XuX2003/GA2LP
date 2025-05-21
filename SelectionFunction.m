function tempPopulation = SelectionFunction(populationMat,populationNumber,p)

tempPopulation = cell(populationNumber,4);
for k1 = 1:populationNumber
    selectValue = SelectValue(p);
    tempPopulation(k1,:) = populationMat(selectValue,:);
end
    