## Load Dictionary and select random word between 5 and 12 characters long
dictionary = File.readlines('dictionary.txt', chomp: true) if File.exist?('dictionary.txt')
words = dictionary.select {|word| word.length.between?(5, 12)}
secret_word = words.sample

## Create Display for secret word and print it
secret_word_display = Array.new(secret_word.length) {|i| "_"}
puts secret_word_display.join(" ")

guesses_left = 5

