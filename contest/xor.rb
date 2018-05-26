t = gets().chomp.to_i
for i in 1..t
    n=gets().chomp.to_i
    a=gets().split().map{|x| x.chomp.to_i}
    b=[]
    for j in 0..n**2-1
      b[j] = a[j/n] + a[j%n]
    end
    p b
    puts b.reduce(:^)
end