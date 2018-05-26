t = gets().chomp.to_i
for i in 1..t
    n,k=gets().split().map{|x| x.chomp.to_i}
    a=gets().split().map{|x| x.chomp.to_i}
    m,t=a.partition.each_with_index{|x,i| i.even?}
    p m
    p t
    if t.empty?
        puts "NO"
    elsif m.reduce(:+) < t.reduce(:+)
        puts "YES"
    else
        for j in 0..k-1
            swp_cst = t.map.each_with_index{|x,i|
                if m[i+1] != nil
                    m[i]-t[i] > m[i+1]-t[i] ? [m[i]-t[i],i] : [m[i+1]-t[i],i+1]
                else
                    [m[i] - t[i],i]
                end
            }
            swp=swp_cst.each_with_index.max
            t[swp[1]]+=swp[0][0]
            m[swp[0][1]]-=swp[0][0]
            if m.reduce(:+) < t.reduce(:+)
                puts "YES"
                break
            end
        end
        if m.reduce(:+) >= t.reduce(:+)
            puts "NO"
        end
        
    end
end