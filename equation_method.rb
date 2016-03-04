#!/usr/bin/env ruby

# equation method finds the number of digits in the input number, 
# then sums each digit / 10^n+1  where n is the o-based index of the digit in the number.
# Note that there will be errors with Floats involved here.
def f(natural_number)
  digits = Math.log10(natural_number).floor  # 0-based number of digits in the input number
  
  running_sum = 0
  digit_magnitude = 10
  aggregate_decimal = 0.0
  digits.downto(0) do |digit|
    digit_value = (natural_number % digit_magnitude * 10 ) / (digit_magnitude)
    
    aggregate_decimal += (digit_value.to_f)/(digit_magnitude.to_f)
    running_sum += digit_value * (digit_magnitude/10)
    digit_magnitude *= 10
  end

  aggregate_decimal

end

puts f(1256)


