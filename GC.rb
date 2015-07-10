# returns de percentage of G and C on a string of DNA
def gc(string)
  gc_count = string.split('').count { |symbol| symbol == 'G' || symbol == 'C' }
  gc_count.to_f / (string.length) * 100
end

fasta = File.open('tests.txt', "r") { |file| file.read  }

# returns array of label + DNA strings
fasta = fasta.split('>').reject(&:empty?)

# separates the string form the label
fasta.map! do |sequence|
    [sequence.scan(/Rosalind_\d{4}/)[0],
     sequence.scan(/[ATCG]/).join]
  end

fasta.each_with_index { |sequence, index| fasta[index][1] = gc(sequence[1]) }

fasta = fasta.sort_by { |sequence| sequence[1] }

higher_gc = fasta.last

puts higher_gc[0]
puts higher_gc[1].round(6)
