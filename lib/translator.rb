require "yaml"

def load_library(file)
  hash = YAML.load_file(file) # Use load_file to get an initial hash of arrays
  hash.each_pair do |meaning, emote_array|
    hash[meaning] = { :english => emote_array[0], :japanese => emote_array[1] } # For each top-level key (meaning), assign a hash of arrays with :english, :japanese languages as the keys
  end
end

def get_japanese_emoticon(file, icon)
  hash = load_library(file) # Use our previous method to load the yaml file
  hash.each_pair do |meaning, languages| # Use each_pair enumerable to give us access to 
    languages.each_pair do |emote|
      if icon == emote[1]
        return languages[:japanese]
      end
    end
  end
  return "Sorry, that emoticon was not found"
end

def get_english_meaning(file, icon)
  hash = load_library(file)
  hash.each_pair do |meaning, languages|
    languages.each_pair do |emote|
      if icon == emote[1]
        return meaning
      end
    end
  end
  return "Sorry, that emoticon was not found"
end