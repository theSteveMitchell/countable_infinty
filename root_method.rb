#!/usr/bin/env ruby

# Root method simply takes each digit of the input number as a string,
# reverses them, and puts them to the right of the decimal
def f(natural_number)
  string = natural_number.to_s
  string.reverse!
  "0.#{string}"
end

def r(decimal)
  string = decimal.to_s
  string.reverse.gsub(".0", "")
end

def diagonal(min, max)
  #we're going through the loop twice, just for clarity
  puts "Listing f(#{min}) through f(#{max}):"
  min.upto(max) do |i|
    puts i.to_s + " | " +  f(i)
  end

  puts "Testing diagonal proof for f(#{min}) through f(#{max}):"
  position = 2
  aggregate = "0."
  min.upto(max) do |i|
    decimal = f(i)
    if position < decimal.length
      puts decimal[0..position-1] + "|" + decimal[position] + "|" + decimal[position+1..-1]
    else
      puts decimal
    end
    choice = ( decimal.to_s[position]).to_i + 1
    choice = 0 if choice == 10
    aggregate[position] = choice.to_s
    position += 1
  end

  puts "\nDiagonal proof asserts that this number can't be in f:"
  puts aggregate

  trump = r(aggregate)
  puts "But actually f(#{trump}) = #{aggregate}"
end

n = 25
puts "listing first #{n} elements of set"
0.upto(n) do |i|
  puts f(i)
end

diagonal(975310824659753108246597531082465, 975310824659753108246597531082497)