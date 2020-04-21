require "yaml"

def load_library(file)
  hash = YAML.load_file(file) # Use load_file to get a hash (meaning) of arrays (emote_array)
  hash.each_pair do |meaning, emote_array|
    hash[meaning] = {:english => emote_array[0], :japanese => emote_array[1] }
  end
end

def get_japanese_emoticon(file, icon)
   hash = load_library(file)
   hash.each_pair do |meaning, languages|
    languages.each_pair do |emote|
      if icon == emote[1]
        return languages
      end
    end
  end
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
end