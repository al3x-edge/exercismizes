class Bob
  def hey(input)
    respond_to_input(input)
  end

  private
  def respond_to_input(s)
    if (s =~ /^[0-9]/)
      if is_question_numbers?(s)
        'Whatever.'
      elsif is_shouting_numbers?(s)
        'Woah, chill out!'
      else
        'Sure.'
      end
    elsif s.end_with?('?')
      if is_shouting?(s)
        'Woah, chill out!'
      else
        'Sure.'
      end
    elsif is_silence?(s)
      'Fine. Be that way!'
    elsif is_shouting?(s)
      'Woah, chill out!'
    else
      'Whatever.'
    end
  end

  # Helpers
  def is_shouting?(s)
    s.eql?(s.upcase)
  end

  def is_shouting_numbers?(s)
    s =~ /[0-9, A-Z!]/
  end

  def is_question_numbers?(s)
    s =~ /[0-9?]/
  end

  def is_silence?(s)
    is_blank?(s)
  end

  def only_nums?(s)
    !!(s =~ /([\d\s,?]+)\z/)
  end

  def is_blank?(s)
    s !~ /[^[:space:]]/
  end
end
