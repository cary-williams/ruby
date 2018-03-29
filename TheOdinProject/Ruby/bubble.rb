
# For each element in list, look at the element and the one to the right.
# If they are out of order, swap them. Do this until all are sorted.
# The maximum amount of loops ever needed is n-1 where n is the length of the array.
#
# Example: for [5, 1, 2, 4]
# [1, 5, 2, 4] => [1, 2, 5, 4] => [1, 2, 4, 5]



def bubble list
  max = list.length - 2 # so that right hand element doesn't hit nil
  swapped = true # initial setting. will change depending on if any elements are swapped.

  return list if list.length < 2 # No need to process if there aren't more than 1 item in array.

  until not swapped do
    swapped = false # set to false at beginning of loop. if nothing is swapped later, we can break.

    0.upto(max) { |i|
      if list[i] > list[i+1]
        list[i], list[i+1] = list[i+1], list[i] # swap elements
        swapped = true # set flag to true since we swapped.
      end

    }

  end

  list
end
bubble [1]
