table = File.open('codon_table.txt', 'r') { |f| f.read }

# splits the table into the various codon-aminoacid pair
table = table.split(/\n|\s{2,}/)

@codon_hash = {}

# creates an hash that has aminoacids as keys and
# an array of the correspondent codons as values
table.each do |pair|
  pair = pair.split(/\s/)
  if @codon_hash.key?(pair[1])
    @codon_hash[pair[1]] += [pair[0]]
  else
    @codon_hash[pair[1]] = [pair[0]]
  end
end

# returns the aa that the codon expresses
def codon_to_aa(codon)
  @codon_hash.each do |aa, codons|
    @aminocacid = aa if codons.include?(codon)
  end
  @aminocacid
end

string = File.open('tests.txt', 'r') { |f| f.read }

codons = string.scan(/.../)

protein = codons.map { |codon| codon_to_aa(codon) }

protein.delete_at(-1)

puts protein.join

