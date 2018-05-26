t = gets().chomp().to_i
for i in 1..t
    word, k = gets().chomp().split()
    c=0
    size=word.size
    (1..size).each do |l|
        (0..size - l).each do |i|
          occ = word[i,l].split(%r{}).inject(Hash.new(0)){|total, o| total[o]+=1;total}
          if occ.size() >= k.to_i && occ.map{|k,v| v}.uniq.count == 1
            c+=1
          end
        end
    end
    puts c
end
