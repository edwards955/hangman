class Hangman
  attr_accessor :secret_word, :correct, :incorrect, :guesses_left

  def initialize
    dictionary = File.readlines('dictionary.txt', chomp: true) if File.exist?('dictionary.txt')
    words = dictionary.select { |word| word.length.between?(5, 12) }
    @secret_word = words.sample
    @correct = Array.new(secret_word.length) { '_' }
    @incorrect = []
    @guesses_left = 5
    puts secret_word
  end

  def display(array)
    puts "Secret Word: #{array.join(' ')}"
    puts
  end

  def incorrect_display(array)
    puts "Incorrect Letters: #{array.join(' ')}"
    puts
  end

  def get_guess
    puts 'Guess a letter:'
    gets.chomp.downcase
  end

  def check_for_letters(guess)
    (0...secret_word.length).find_all { |i| secret_word[i, 1] == guess }
  end

  def check_guess(letters_found, guess)
    if letters_found.empty?
      self.guesses_left -= 1
      incorrect.push(guess)
      puts
      puts "Incorrect. You have #{guesses_left} guesses left."
    else
      letters_found.each { |i| correct[i] = guess }
      puts
      puts 'Correct!'
    end
  end

  def play
    until guesses_left.zero?
      display(correct)
      incorrect_display(incorrect)
      guess = get_guess
      letters_found = check_for_letters(guess)
      check_guess(letters_found, guess)
      break if correct.none?('_')
    end

    guesses_left.zero? ? (puts 'You lose!') : (puts 'You win!')
  end
end

game = Hangman.new
game.play
