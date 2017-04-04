defmodule Exmath do
  def factorial(n) when n <= 1, do: 1

  @doc """
  Factorial will multiply n with n-1 until n <= 1
  """
  def factorial(n) do
    n * factorial(n-1)
  end

  @doc """
  Combinations formula
  A formula for the number of possible combinations of r elements from a set of n elements
  """
  def nCr(n, r) do
    factorial(n)/(factorial(r)*factorial((n-r)))
  end

  @doc """
  Permutations formula
  A formula for the number of possible permutations of r elements from a set of n elements
  """
  def nPr(n, r) do
    factorial(n)/factorial((n-r))
  end

  @doc """
  Prints row r of pascals triangle
  Calculated using the previously implemented nCr formula
  """
  def pascals_triangle_row(r) do
    Enum.map((0..r), fn(c) -> nCr(r, c) end)
  end
end