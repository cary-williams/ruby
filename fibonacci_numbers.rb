def fib(num)
  sum = 0
   i, j = 0, 1
   while i <= num
     if i % 2 ==0
       sum += i
     end
     i, j = j, i + j
   end
puts sum
end

fib(100)
