# returns the probability that the mate between o1 and o2 will produce
# an indivudal with a dominant allele
def mate(o1, o2)
  if (o1 || o2) == 'k'
    1
  elsif  o1 == 'n' && o2 == 'n'
    0
  elsif  o1 == 'm' && o2 == 'm'
    0.75
  else
    0.5
  end
end

k, m, n = ARGV.map(&:to_i)

possible_mates = (['k'] * k + ['m'] * m + ['n'] * n).combination(2).to_a

probabilities = possible_mates.map! { |pair| mate(pair[0], pair[1]) / possible_mates.length.to_f}

puts probabilities.inject(&:+)