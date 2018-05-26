t = gets().chomp().to_i
for i in 1..t
    n = gets().chomp().to_i
    arr = gets().chomp().split().map{|x| x.to_i}
    out =  Array.new(arr.size,0)
    d = 1
    while true
        elim = arr.each_cons(3).map{|x| if x[1] >= [x[0],x[2]].min then 0 else 1 end}
        if elim.empty? == true
            break
        end
        elim.each_with_index{|x,i| if x==1 then out[i+d]=d end}
        arr.delete_if.with_index{|x,i| out[i] != 0}
        d+=1
    end
    puts out.join(" ")
end
