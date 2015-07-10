
table = File.open('codon_table.txt', 'r') { |f| f.read }

# splits the table into the various codon-aminoacid pair
table = table.split(/\n|\s{2,}/)

@codon_hash = Hash.new

# creates an hash that has aminoacids as keys and an array of the correspondent codons as values
table.each do |pair|
  pair = pair.split(/\s/)
  if @codon_hash.has_key?(pair[1])
    @codon_hash[pair[1]] += [pair[0]]
  else
    @codon_hash[pair[1]] = [pair[0]]
  end
end

# returns the aa that the codon expresses
def codon_to_aa(codon)
  @codon_hash.each do |aa, codons|
    return aa if codons.include?(codon)
  end
end

string = File.open('../tests.txt', 'r') { |f| f.read }

codons = string.scan(/.../)

puts codons.map { |codon| codon_to_aa(codon) }.join

