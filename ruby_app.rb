# Dorota Suchocka 233218
# Agnieszka Góralczyk 233133

require 'tk'


def play(x)
  if x == 0
    system("start gadu_gadu.mp3")
  elsif x == 1
    system("start skype_sms.mp3")
  elsif x == 2
    system("start swistak.mp3")
  end
end

def addRectangle (x,y)

  if $release==0
    $timer[x] = 0
    TkcRectangle.new(@canvas, x, y, x+5,y+5, 'fill' => 'green')
  elsif $release==1
    $timer[x] = 1
    TkcRectangle.new(@canvas, x, y, x+5,y+5, 'fill' => 'yellow')
  else
    $timer[x] = 2
    TkcRectangle.new(@canvas, x, y, x+5,y+5, 'fill' => 'blue')
  end
end

def play_all
  (1..400).each { |i|
    puts i.to_s
    if $timer[i] == 0
      puts 'Hahahaha 0'
      play(0)
    elsif $timer[i] == 1
      puts 'Hahahaha 1'
      play(1)
    elsif $timer[i] == 2
      puts 'Hahahaha 2'
      play(2)
    end
    sleep 0.1
    #TkcLine.new(@canvas, i, 0, i, 40, 'fill' => 'red')
  }
end

$timer = Hash.new(-1)
root = TkRoot.new() { title "Graj"; minsize(420,200)}
@canvas = TkCanvas.new(root) do
  place('height' => 40, 'width' => 400,
        'x' => 10, 'y' => 10)
end
TkcRectangle.new(@canvas, 0, 0, 400, 40, 'fill' => 'white')
TkcLine.new(@canvas, 0, 10, 400, 10)
TkcLine.new(@canvas, 0, 15, 400, 15)
TkcLine.new(@canvas, 0, 20, 400, 20)
TkcLine.new(@canvas, 0, 25, 400, 25)
TkcLine.new(@canvas, 0, 30, 400, 30)
line = TkcLine.new(@canvas, 1, 0, 0, 40)

@canvas.bind( "1", proc{|x,y| addRectangle(x,y)}, "%x %y")

button_graj = TkButton.new(root) { text 'Graj'; command (proc {play_all}) }
button_graj.pack("side"=>"bottom", "pady"=> "20")
$release = TkVariable.new ( 2 );
button_gg = TkRadioButton.new(root) { text "gg"; variable $release; value 0; }
button_gg.pack("side"=>"bottom")
button_skype = TkRadioButton.new(root) { text "skype"; variable $release; value 1; }
button_skype.pack("side"=>"bottom")
button_swistak = TkRadioButton.new(root) { text "swistak"; variable $release; value 2; }
button_swistak.pack("side"=>"bottom")

Tk.mainloop()

