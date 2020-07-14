nums = [2,7,11,15]
target = 9
def two_sum(nums, target)
  indexes = {}
  nums.each_with_index do |num, i|
    compliment = target - num
    return [indexes[compliment], i] if !indexes[compliment].nil?
    indexes[num] = i
  end
end

puts two_sum(nums, target).to_s