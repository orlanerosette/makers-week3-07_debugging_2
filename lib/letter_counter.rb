class LetterCounter
  def initialize(text)
    @text = text
  end

  def calculate_most_common()
    counter = Hash.new(0)
    most_common_char = nil
    most_common_count = 1
    # not happy with most_common_count = 1 by default
    # don't think this will work with unknown words
    # just assuming the most common count is 1
    # maybe need to calculate the average values in hash and set that to the most common count
    @text.chars.each do |char|
      next unless is_letter?(char)
      counter[char] = (counter[char] || 1) + 1
      if counter[char] > most_common_count
        most_common_char = char
        most_common_count = counter[char]
      end
    end
    return [most_common_count, most_common_char]
  end

  private

  def is_letter?(letter)
    return letter =~ /[a-z]/i
  end
end

counter = LetterCounter.new("Digital Punk")
p counter.calculate_most_common

# Intended output:
# [2, "i"]