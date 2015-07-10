ARGV

dna_string = File.open(ARGV[0], "r") { |file| file.read  }

puts dna_string.reverse.gsub(/[ACTG]/, 'A' => 'T', 'C' => 'G', 'T' => 'A', 'G' => 'C')


