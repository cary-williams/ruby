def englishNumber number
    d = { 0 => 'zero', 1 => 'one', 2 => 'two', 3 => 'three', 4 => 'four', 5 => 'five',
          6 => 'six', 7 => 'seven', 8 => 'eight', 9 => 'nine', 10 => 'ten',
          11 => 'eleven', 12 => 'twelve', 13 => 'thirteen', 14 => 'fourteen',
          15 => 'fifteen', 16 => 'sixteen', 17 => 'seventeen', 18 => 'eighteen',
          19 => 'nineteen', 20 => 'twenty',
          30 => 'thirty', 40 => 'forty', 50 => 'fifty', 60 => 'sixty',
          70 => 'seventy', 80 => 'eighty', 90 => 'ninety' }
    k = 1000
    m = 1000000
    b = 1000000000
    t = 1000000000000

    if 0 > number
        return "Please enter a positive integer"
    end
    if number <= 20
        return d[number]
    end
    if number < 100
        if number % 10 == 0
          return d[number]
        else
            return d[number / 10 * 10] + '-' + d[number % 10]
        end
    end

    if number < k
        if number % 100 == 0
            return d[number / 100] + ' hundred'
        else
            return d[number / 100] + ' hundred and ' + englishNumber(number % 100)
        end
    end

    if number < m
        if number % k == 0
            return englishNumber(number / k) + ' thousand'
        else
            return englishNumber(number / k) + ' thousand ' + englishNumber(number % k)
        end
      end

    if number < b
        if number % m == 0
            return englishNumber(number / m) + ' million'
        else
            return englishNumber(number / m) + ' million ' + englishNumber(number % m)
        end
    end

    if number < t
        if number % b == 0
            return englishNumber(number / b) + ' billion'
        else
            return englishNumber(number / b) + ' billion ' + englishNumber(number % b)
        end
   elsif number == t
        return "one trillion"

    else
        return "that number is too big"
    end
end
