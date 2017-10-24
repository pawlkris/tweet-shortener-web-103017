require 'pry'

def dictionary
  dictionary = {
    "HELLO" => "hi",
    "TO" => "2",
    "TWO" => "2",
    "TOO" => "2",
    "FOR" => "4",
    "FOUR" => "4",
    "BE" => "b",
    "YOU" => "u",
    "AT" => "@",
    "AND" => "&"
  }
  return dictionary
end

def word_substituter(tweet)
  dict = dictionary()
  keys = dict.keys
  tweet = tweet.split
  tweet = tweet.collect do |x|
    if keys.include?(x.upcase)
      x = dict[x.upcase]
    else x = x
    end
  end
  return tweet.join(" ")
end

def bulk_tweet_shortener(array)
  array = array.collect do |x|
    x = word_substituter(x)
  end
  array.each {|x| puts(x)}
end

def selective_tweet_shortener(array) # rspec is giving me an error that collect is not defined in this method... I tried changing it to a loop and it didn't recognize length as a method...
  array = array.collect do |x|
    if x.length > 140
      x = word_substituter(x)
    else
      x = x
    end
  end
  return array
end

def shortened_tweet_truncator(array)
  array = selective_tweet_shortener(array)
  array = array.collect do |x|
    if x > 140
      x = "#{x[0..136]}..."
    else
      x = x
    end
  end
    return array
end
