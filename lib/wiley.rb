class WileySquare
  require 'algorithms' 
  
  =begin
    first implementation
    - read .lst file
    - only get words with certian length
    - do a push ("word", "word")
    - use wildcard to find matching words
  =end
  
  def self.create_square(file_name, word_size)
    wiley = WileySquare.new(file_name, word_size)
    wiley.find_square
  end
  
  def initialize(file_name, word_size)
    @file_name = file_name
    @word_size = word_size
    @trie = Containers::Trie.new
  end

  def find_square
    read_lines_with_word_size
  
  end
  
  def read_lines_with_word_size
    File.readlines(@file_name).each do |line|
      word = line.strip.downcase
      if word and word.size == @word_size
        @trie.push(word, word)
      end 
    end  
  end
  
  # private

  
  
end