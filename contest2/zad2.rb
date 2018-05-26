t = gets().chomp().to_i
for i in 1..t
    word = gets().chomp()
    c=0
    for j in 1..word.size
        word = word.split(%r{}).rotate().join()
        if word == word.reverse
            c+=1
        end
    end
    puts c
end