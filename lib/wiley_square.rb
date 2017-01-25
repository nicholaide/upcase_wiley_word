class WileySquare
  require 'algorithms'
  require 'word_reader.rb' 
  
  EMPTY_LIST = "Unable to get info from dictionary".freeze
  NOT_ENOUGH = "Not enough words to work with".freeze  
  NO_SQUARE = "No square found".freeze  
  
     
#     first implementation
#     - read .lst file
#     - only get words with certian length
#     - do a push ("word", "word")
#     - use wildcard to find matching words

  
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
    word_list = WordReader.read_words_with_size(@file_name, @word_size)
    if word_list.nil? or word_list.empty?
      return EMPTY_LIST
    elsif word_list.size < @word_size
      return NOT_ENOUGH
    end
    
    @word_list = word_list
    populate_trie()
    
    @word_list.each do |word|
      a_wiley_square =  construct_square_with(word) 
      if a_wiley_square.empty?
        next
      elsif
        a_wiley_square # probably some formatting
      end
      
    end
    
    return NO_SQUARE
  end
    
  private  
  
    def populate_trie
      @word_list.map { |w| @trie.push(w,w)}
    end
    
    # return empty array if cannot find a square
    def construct_square_with(starting_word)
      return []
    end

end