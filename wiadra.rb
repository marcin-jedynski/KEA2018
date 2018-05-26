#!/usr/bin/env ruby
n = gets().chomp.to_i
for i in 1..n
    b=gets().chomp.to_i
    h=0
    line=gets().chomp.split()
    for x in range (0..line.length-1)
        if(x==0)
            h=h+line[x]
        else
            if(line[x]>line[x-1])
                h=h+line[x]
            end
        end
            
    end
    
    

end