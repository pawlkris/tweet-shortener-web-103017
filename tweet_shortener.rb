
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

def selective_tweet_shortener(tweet)
  if tweet.length > 140
    tweet = word_substituter(tweet)
  end
  return tweet
end

def shortened_tweet_truncator(tweet)
  x = selective_tweet_shortener(tweet)
  if x.length > 140
    x = "#{x[0..136]}..."
  end
  return x
end
