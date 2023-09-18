## Load Dictionary and select random word between 5 and 12 characters long
dictionary = File.readlines('dictionary.txt', chomp: true) if File.exist?('dictionary.txt')
words = dictionary.select {|word| word.length.between?(5, 12)}
secret_word = words.sample
puts secret_word

## Create Display for secret word and print it
secret_word_display = Array.new(secret_word.length) { '_' }

## Create array to hold incorrect guesses
incorrect = []

guesses_left = 5

def display(array)
  puts "Secret Word: #{array.join(' ')}"
  puts
end

def incorrect_display(array)
  puts "Incorrect Letters: #{array.join(' ')}"
  puts
end

until guesses_left.zero?
  display(secret_word_display)
  incorrect_display(incorrect)
  puts 'Guess a letter:'
  guess = gets.chomp.downcase
  letters_found = (0...secret_word.length).find_all { |i| secret_word[i, 1] == guess }
  if letters_found.empty?
    guesses_left -= 1
    incorrect.push(guess)
    puts
    puts "Incorrect. You have #{guesses_left} guesses left."
  else
    letters_found.each do |i|
      secret_word_display[i] = guess
    end
    puts
    puts 'Correct!'
  end
end


