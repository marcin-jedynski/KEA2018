require 'prime'
require 'set'
t = gets().chomp.to_i
for i in 1..t
    length=gets().chomp.to_i
    numbers=gets().split().map{|x| x.chomp.to_i}
    fact=numbers.map{|x| x.prime_division}.map{|x| x.map{ |y| y[0] }}.map{|x| Set.new(x)}
    intersct=fact.reduce(:&)
    if intersct.empty? || intersct == Set[1]
        puts 0
    else
        puts -1
    end
end