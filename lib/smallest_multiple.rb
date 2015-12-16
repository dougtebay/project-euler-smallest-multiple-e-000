# Implement your procedural solution here!

# Please note that I used the explanation (but not the code)
# at https://maikolsolis.wordpress.com/2014/02/08/project-euler-5-smallest/ to solve this.
def smallest_multiple(num)
  multiples = []
  total = 1
  (2..num).each do |i|
    # If i is prime add it to array of multiples
    if is_prime?(i)
      multiples << i
    else
      # If i isn't prime get its prime factors
      factors = prime_decomposition(i)
      # Compare the count of each prime factor against the count for that number in multiples
      factors.each do |factor|
        if multiples.count(factor) < factors.count(factor)
          multiples << factor
        end
      end
    end
  end
  multiples.each do |multiple|
    total *= multiple
  end
  total
end

# Find the prime factors of num
def prime_decomposition(num, prime=num)
  answer = []
  # Finds the next prime below num
  prime = next_prime_below(prime)
  # Executes block if num is evenly divisible by prime
  if num % prime == 0
    # Adds found prime factor to array
    answer.push(prime)
    factor = num / prime
    # Adds other factor to array if it's prime
    if is_prime?(factor)
      answer.push(factor)
    # Makes a recursive call if other factor isn't prime
    else
      answer.push(prime_decomposition(factor))
    end
  # Makes a recursive call if num isn't evenly divisible by the next prime below num
  else
    answer.push(prime_decomposition(num, prime))
  end
  answer.flatten
end

# Find the next prime below num
def next_prime_below(num)
  prime = 0
  while prime == 0
    num -= 1
    prime = num if is_prime?(num)
  end
  return prime
end

# Check whether num is prime
def is_prime?(num)
  (num - 1).downto(2).each do |i|
    return false if num % i == 0
  end
  return true
end

# Brute force solution
=begin
def smallest_multiple(num)
  counter = 0
  smallest = 0
  while smallest == 0
    counter += 1
    smallest = counter if evenly_divisible(num, counter)
  end
  smallest
end

def evenly_divisible(num, counter)
  (1..num).each do |i|
    if counter % i != 0
      return false
    end
  end
  return true
end
=end