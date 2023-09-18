## Load Dictionary and select random word between 5 and 12 characters long
dictionary = File.readlines('dictionary.txt', chomp: true) if File.exist?('dictionary.txt')
words = dictionary.select {|word| word.length.between?(5, 12)}
secret_word = words.sample

## Create Display for secret word and print it
secret_word_display = Array.new(secret_word.length) {|i| "_"}
puts secret_word_display.join(" ")

## Create array to hold incorrect guesses
incorrect_guesses = []

guesses_left = 5

def display(array)
  puts array.join(' ')
end

puts 'Guess a letter:'
guess = gets.chomp.downcase
letters_found = (0...secret_word.length).find_all { |i| secret_word[i, 1] == guess }
if letters_found.empty?
  guesses_left =- 1
  incorrect_guesses.push(guess)
  puts "Incorrect. You have #{guesses_left} guesses left. Try again."
else
  letters_found.each do |i|
    secret_word_display[i] = guess
    puts 'Correct! Guess again.'
  end
end


