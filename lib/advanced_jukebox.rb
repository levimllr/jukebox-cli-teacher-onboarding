require "pry"

#Here is the song hash you will be working with. Each key is a song name and each value is the location of it's mp3 file.
#make sure to edit the value of each key to replace < path to this directory >
#with the correct path to this directory on your computer

my_songs = {
"Go Go GO" => '//home/levi/Development/jukebox-cli-teacher-onboarding/audio/Emerald-Park/01.mp3',
"LiberTeens" => '/home/levi/Development/jukebox-cli-teacher-onboarding/audio/Emerald-Park/02.mp3',
"Hamburg" =>  '/home/levi/Development/jukebox-cli-teacher-onboarding/audio/Emerald-Park/03.mp3',
"Guiding Light" => '/home/levi/Development/jukebox-cli-teacher-onboarding/audio/Emerald-Park/04.mp3',
"Wolf" => '/home/levi/Development/jukebox-cli-teacher-onboarding/audio/Emerald-Park/05.mp3',
"Blue" => '/home/levi/Development/jukebox-cli-teacher-onboarding/audio/Emerald-Park/06.mp3',
"Graduation Failed" => '/home/levi/Development/jukebox-cli-teacher-onboarding/audio/Emerald-Park/07.mp3'
}

def help
  puts "I accept the following commands:"
  puts "- help : displays this help message"
  puts "- list : displays a list of songs you can play"
  puts "- play : lets you choose a song to play"
  puts "- exit : exits this program"
end

def list(my_songs)
  #this method is different! Collect the keys of the my_songs hash and 
  #list the songs by name
  my_songs_key_array = my_songs.keys
  my_songs_key_array.each_with_index do |song, index|
    puts "#{index + 1}. #{song}"
  end 
end


def play(my_songs)
  #this method is slightly different!
  #you should still ask the user for input and collect their song choice
  #this time, only allow user's to input a song name
  #check to see if the name they give is in fact a key of the my_songs hash
  #if it isn't, tell them their choice is invalid
  #if it is, play the song using the system 'open <file path>' syntax
  #get the file path of the song by looking it up in the my_songs hash
  puts "Please enter a song name:"
  input = gets.chomp
  # binding.pry
  if my_songs[input] == nil
    puts "Invalid input, please try again"
  else
    puts "Playing #{input}"
    system "xdg-open #{my_songs[input]}"
  end
end

def exit_jukebox
  #this method is the same as in jukebox.rb
  puts "Goodbye"
end

def run(my_songs)
  #this method is the same as in jukebox.rb
  help
  response = ""
  until response == "exit"
    puts "Please enter a command:"
    response = gets.chomp
    if response == "help"
      help
    elsif response == "list"
      list(my_songs)
    elsif response == "play"
      play(my_songs)
    else
      puts "Please enter an accepted command."
      help
    end
  end
  exit_jukebox
end

# run(my_songs)