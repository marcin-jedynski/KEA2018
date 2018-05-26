def adjList(x,y,n,m)
    l = []
    if (x+1<n) then l << [x+1,y] end
    if (x-1>=0) then l << [x-1,y] end
    if (y+1<m) then l << [x,y+1] end
    if (y-1>=0) then l << [x,y-1] end
    return l
end

t = gets().chomp.to_i
for i in 1..t
    n,m = gets().chomp.split().map{|x| x.to_i}
    grid = []
    q = []
    for j in 0..n-1
        line  = gets().chomp().split(%r{}).map{|x| x.to_i}
        line.each_with_index{|x,a| if x == 1 then q << [j,a] end}
        grid << line
        d = grid.map.with_index{|x,a| x.map.with_index{|y,b| if y == 1 then y = 0 else y = -1 end}}
    end
    gets()
    while !q.empty?
        x,y = q.shift
        for adj in adjList(x,y,n,m)
            a,b = adj
            if(d[a][b] == -1)
                q << [a,b]
                d[a][b] = d[x][y] + 1
            end
        end
    end
    for line in d
        puts line.join(" ")
    end
    if i != t then puts("") end
end
return 0