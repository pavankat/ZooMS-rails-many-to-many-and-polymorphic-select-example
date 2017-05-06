#!/usr/bin/env ruby

animals = ['cat', 'dog', 'bear']
puts 'give me your name'
name = gets.chomp
puts "your name is #{name.length} letters long"
puts "here's a random animal: #{animals.sample}"

if name == 'jeff'
	puts 'his name is Jeff!!!!!'
end

unless name == 'jeff'
	puts 'the name is not jeff!'
end



# animals.sample

# var animals = ['cat', 'dog', 'bear'];

# console.log(animals[(Math.random()*animals.length)-1]);