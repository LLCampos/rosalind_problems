ARGV

dna_string = File.open(ARGV[0], "r") { |file| file.read  }

rna_string = dna_string.gsub('T','U')

puts rna_string