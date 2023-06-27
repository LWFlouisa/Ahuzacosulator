require "naive_bayes"

#system("ruby generate.rb; echo 'New Poem Is Generated'")

sleep(1)

grammar = NaiveBayes.new(:sense, :nonsense)

## Sense
grammar.train(:sense, "[  lez cabine braun ] [ es oublier hente ]", "sense") 
grammar.train(:sense, "[   lez cabine vert ] [ es oublier hente ]", "sense")
grammar.train(:sense, "[   lez cabine gris ] [ es oublier hente ]", "sense")
grammar.train(:sense, "[ lez demeure braun ] [ es oublier hente ]", "sense")
grammar.train(:sense, "[  lez demeure vert ] [ es oublier hente ]", "sense")
grammar.train(:sense, "[  lez demeure gris ] [ es oublier hente ]", "sense")
grammar.train(:sense, "[  lez zigner braun ] [ es oublier hente ]", "sense")
grammar.train(:sense, "[   lez zigner vert ] [ es oublier hente ]", "sense")
grammar.train(:sense, "[   lez zigner gris ] [ es oublier hente ]", "sense")

## Nonsense
grammar.train(:nonsense, "[ es oublier hente ] [  lez cabine braun ]", "nonsense") 
grammar.train(:nonsense, "[ es oublier hente ] [   lez cabine vert ]", "nonsense")
grammar.train(:nonsense, "[ es oublier hente ] [   lez cabine gris ]", "nonsense")
grammar.train(:nonsense, "[ es oublier hente ] [ lez demeure braun ]", "nonsense")
grammar.train(:nonsense, "[ es oublier hente ] [  lez demeure vert ]", "nonsense")
grammar.train(:nonsense, "[ es oublier hente ] [  lez demeure gris ]", "nonsense")
grammar.train(:nonsense, "[ es oublier hente ] [  lez zigner braun ]", "nonsense")
grammar.train(:nonsense, "[ es oublier hente ] [   lez zigner vert ]", "nonsense")
grammar.train(:nonsense, "[ es oublier hente ] [   lez zigner gris ]", "nonsense")

puts "\n"

new_phrase = File.readlines("_imaginedpath/outcomes/input.txt")

row = 0

iteration = new_phrase.size.to_i

iteration.times do
  result = grammar.classify(*new_phrase[row])

  first_label        = result[0]
  first_probability  = result[1]

  puts "Charlotte << This statement in Francais makes #{first_label} with a probability of #{first_probability}."

  open("_longterm/memory/statements.txt", "a") { |f|
    f.puts "[ This statement in Francais makes #{first_label} with a probability of #{first_probability}. ]"
  } 

  row = row + 1
end
