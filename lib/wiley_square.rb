class WileySquare
  require 'algorithms'
  require 'word_reader.rb' 
  
  EMPTY_LIST = "Unable to get info from dictionary".freeze
  NOT_ENOUGH = "Not enough words to work with".freeze  
  
     
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
    
    populate_trie(word_list)
  end
    
  private  
    def populate_trie(word_list)
      word_list.map { |w| @trie.push(w,w)}
    end

end