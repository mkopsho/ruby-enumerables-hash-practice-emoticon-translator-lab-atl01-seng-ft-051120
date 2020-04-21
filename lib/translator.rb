require "yaml"

def load_library(file)
  hash = YAML.load_file(file) # Use load_file to get an initial hash of arrays.
  hash.each_pair do |meaning, emote_array|
    hash[meaning] = { :english => emote_array[0], :japanese => emote_array[1] } # For each top-level key (meaning), assign a hash of arrays with :english, :japanese languages as the keys.
  end
end

def get_japanese_emoticon(file, icon)
  hash = load_library(file) # Use our previous method to load the yaml file.
  hash.each_pair do |meaning, languages| # Use each_pair enumerable to give us access to the first nested hash that we just made.
    e # Use each_pair enumerable to give us access to the arrays of emoticons.
      if icon == emote[1]
        return languages[:japanese] # If the icon parameter matches the second emote in the array, return the equivalent Japanese emote.
      end
    end
  end
  return "Sorry, that emoticon was not found" # If nothing returned, we didn't find that emote.
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