comOptions = ['r', 'p', 's']

cc = comOptions.sample
puts "computer chose #{cc}"

puts 'choose r, p or s'
uc = gets.chomp

if cc == uc 
	puts 'you tie'
elsif (cc == 'r' and uc == 's') or (cc == 'p' and uc == 'r') or (cc == 's' and uc == 'p')
	puts 'computer won'
else
	puts 'user won'
end 