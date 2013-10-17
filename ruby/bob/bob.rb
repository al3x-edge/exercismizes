class Bob
  def initialize
    @answers = {
      asking:   'Sure.',
      fine:     'Fine. Be that way!',
      shouting: 'Woah, chill out!',
      whatever: 'Whatever.'
    }.freeze
  end

  def hey(input)

    phrase = Phrase.new(input)

    return @answers[:fine] if phrase.silent?
    return @answers[:shouting] if phrase.yelling?
    return @answers[:asking] if phrase.questioning?
    @answers[:whatever]
  end
end

class Phrase < String
  def silent?
    self !~ /[^[:space:]]/
  end

  def yelling?
    self.count("a-zA-Z") > 0 && self.upcase == self
  end

  def questioning?
    self.end_with?('?')
  end

  def asking?
    !yelling? && questioning?
  end
end
