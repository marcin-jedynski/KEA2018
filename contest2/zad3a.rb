t = gets().chomp().to_i
for i in 1..t
    n = gets().chomp().to_i
    arr = gets().chomp().split().map{|x| x.to_i}
    out =  Array.new(arr.size,0)
    d=1
    temp = []
    f= true
    while f == true
        f = false
        for j in 0..arr.size-3
            if arr[j+1] < [arr[j],arr[j+2]].min
                f = true
                out[j+1]=d
                temp << arr[j]
                temp << arr[j+2]
            end
        end
        d+=1
        arr = temp
        p out
    end
    puts out.join(" ")
end