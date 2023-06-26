require 'programr'

brains = Dir.glob("_imaginedpath/brains/*")

robot = ProgramR::Facade.new
robot.learn(brains)

begin
  print "YOU >> "
  s = STDIN.gets.chomp
  
  if s != 'quit'
    reaction = robot.get_reaction(s)
    STDOUT.puts "CHARLOTTE << #{reaction}"
  end
end while s != 'quit'
