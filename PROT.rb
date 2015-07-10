
table = File.open('codon_table.txt', 'r') { |f| f.read }

table = table.split(/"\n" | ' '{2,}/)

print table