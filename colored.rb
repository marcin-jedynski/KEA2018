

n,m = gets().chomp().split().map{|x| x.to_i}
adjHash = {}
for i in 1..m
    line = gets().chomp().split().map{|x| x.to_i}
    if adjHash[line[0]]
        adjHash[line[0]] << {'adj' => line[1],'col' => line[2]}
    else
        adjHash[line[0]] = [{'adj' => line[1],'col' => line[2]}]
    end
end
p adjHash