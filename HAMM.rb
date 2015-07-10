def count_mutations(strings)
  mutations = 0
  (0..strings[1].length - 1).each do |position|
    mutations += 1 if strings[0][position] != strings[1][position]
  end
  mutations
end

strings = File.open('tests.txt', "r") { |file| file.read  }

strings = strings.split("\n").map { |string| string.split(//) }

puts count_mutations(strings)
