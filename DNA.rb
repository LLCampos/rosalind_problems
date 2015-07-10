dataset = ARGV[0]

# reads the file and puts its contents on variable data
data = File.open(dataset ,"r") { |file| file.read }

# turns the DNA string into an array of nucleotide symbols
data = data.split('')

# creates output variable
output = []

# counts how much of each symbol the data has and inserts the count into output
%w(A T G T).each do |symbol|
  output << data.count { |nucleotide| symbol == nucleotide }
end

puts output.join(' ')