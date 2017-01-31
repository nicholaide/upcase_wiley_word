# reads a file that contains a list of dictionary words
# returns an array of strings having size N 
class WordReader
  
  def self.read_words_with_size(file_name, word_size)
    word_list = []
    File.readlines(File.expand_path(file_name, __FILE__)).each do |line|
      word = line.strip.downcase if line
      if word.size == word_size
        word_list.push(word)
      end 
    end  
    word_list
  rescue => exc
    puts exc.message
    return nil  
  end
  
end