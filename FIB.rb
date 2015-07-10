def rabbits(n, k)
  if n == 1 || n == 2
    1
  else
  result = (rabbits(n - 2, k) * k) + rabbits(n - 1, k)
  end
end