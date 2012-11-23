# Dorota Suchocka 233218
# Agnieszka Góralczyk 233133

require 'tk'

def play(path)
  system("start" + " " + path)
end

root = TkRoot.new() { title "Graj" }

button_gg = TkButton.new(root) { text "Graj gg"; width 20; height 10; command (proc {play( "gadu_gadu.mp3" )})}
button_gg.pack("side"=>"right")

button_skype = TkButton.new(root) { text "Graj skype"; width 20; height 10; command (proc {play( "skype_sms.mp3" )}) }
button_skype.pack("side"=>"left")

button_swistak = TkButton.new(root) { text "Graj swistak"; width 20; height 10; command (proc {play( "swistak.mp3" )}) }
button_swistak.pack("side"=>"bottom")

Tk.mainloop()

