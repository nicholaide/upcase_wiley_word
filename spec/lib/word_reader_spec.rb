require_relative "../../lib/word_reader.rb"

describe "Word Reader" do
  
  it "returns an array of words with size or length of 4" do
    results = WordReader.read_words_with_size("../../spec/lib/sample_words.lst", 4)
    expect(results.size).to eq(5)
  end
  
  it "returns an array of words with size of 5" do 
    results = WordReader.read_words_with_size("../../spec/lib/sample_words.lst", 5)
    expect(results.size).to eq(3)    
  end
  
  it "returns nil on error" do
    results = WordReader.read_words_with_size("../../spec/lib/does_not_exist.lst", 5)
    expect(results).to eq(nil)
  end
  
  it "returns an empty array if no words of size n is found" do
    results = WordReader.read_words_with_size("../../spec/lib/sample_words.lst", 7)
    expect(results.size).to eq(0)
  end
  
end