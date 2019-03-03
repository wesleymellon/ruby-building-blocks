def substrings(phrase, substrings)
  freq_hash = {}
  substrings.each do |substring, index|
    temp_phrase = phrase.dup.downcase
    substring.downcase!
    count = 0
    while temp_phrase.include?(substring)
      temp_phrase.sub!(substring, "")
      count += 1
    end

    freq_hash[substring] = count if count > 0
  end

  freq_hash
end
