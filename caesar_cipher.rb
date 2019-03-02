def caesar_cipher(cipher, shift_number)
	shifted_cipher = []
  cipher.split("").each do |e|
    if /[a-z|A-Z]/.match?(e)
      shifted_cipher << swap_letter(e, shift_number)
    else
      shifted_cipher << e
    end
  end

  shifted_cipher.join
end

def swap_letter(char, shift_number)
  shift_number %= 26
	shift_char = (char.ord + shift_number).chr
  
  if (/[a-z]/.match?(char) && !/[a-z]/.match?(shift_char))
    shift_char = (shift_char.ord - 26).chr
  elsif (/[A-Z]/.match?(char) && !/[A-Z]/.match?(shift_char))
    shift_char = (shift_char.ord - 26).chr
  end
  shift_char
end
