defmodule Exmath do
  @doc """
  Factorial will multiply n with n-1 until n <= 1.

  # Example

      iex> Exmath.factorial(4)
      24
  """
  @spec factorial(number) :: integer
  def factorial(n) when n <= 1, do: 1
  def factorial(n) do
    n * factorial(n-1)
  end

  @doc """
  Combinations formula.
  A formula for the number of possible combinations of r elements from a set of n elements.
  In combinations order doesn't matter.

  # Example
  
  We have 5 balls, in how many ways can we select 3 of them?

      iex> Exmath.nCr(5, 3)
      10.0
  """
  @spec nCr(number, number) :: float
  def nCr(n, r) do
    factorial(n)/(factorial(r)*factorial((n-r)))
  end

  @doc """
  Permutations formula.
  A formula for the number of possible permutations of r elements from a set of n elements.

  # Example
  
  How many ways can 4 students from a group of 15 be lined up for a photograph?

      iex> Exmath.nPr(15, 4)
      32760.0
  """
  @spec nPr(number, number) :: float
  def nPr(n, r) do
    factorial(n)/factorial((n-r))
  end

  @doc """
  Prints row r of Pascal's triangle.
  Calculated using the previously implemented nCr formula.
  Be aware; Pascal's triangle starts with 0 both column- and row-wise.

  # Example

  What is the 4th row of pascals triangle.

      iex> Exmath.pascals_triangle_row(3)
      [1.0, 3.0, 3.0, 1.0]
  """
  @spec pascals_triangle_row(number) :: [float]
  def pascals_triangle_row(r) do
    Enum.map((0..r), fn(c) -> nCr(r, c) end)
  end

  @doc """
  Hypergeometric distribution without replacement

  # Parameters
  * k -> how many wins
  * nn -> total pool
  * kk -> target total (wins + losses)
  * n -> how many to draw

  # Example

  Imagine we have an urn of 50 marbles. 5 green ones and 45 red ones.
  Blindly we will take 10 marbles from the urn.
  What is the likelihood that we will draw 4 green and 6 red marbles.

  This means we will have k=4, n=10, N=50, K=5.

      iex> Float.round Exmath.hypergeometric_distribution(4, 50, 5, 10), 5
      0.00396
  """
  @spec hypergeometric_distribution(number, number, number, number) :: float
  def hypergeometric_distribution(k, nn, kk, n) do
    (nCr(kk, k)*nCr(nn-kk, n-k))/nCr(nn, n)
  end

  @doc """
  Get the average growth between two points in a graph.

  # Example

  Imagine we have the two points (1, 1) and (10, 10).
  The mathematical formula for calculating this is delta-y/delta-x.

      iex> Exmath.average_growth({1, 1}, {10, 10})
      1.0
  """
  @spec average_growth({number, number}, {number, number}) :: float
  def average_growth(p1, p1), do: 0.0
  def average_growth({p1_x, p1_y}, {p2_x, p2_y}), do: (p2_y-p1_y)/(p2_x-p1_x)

  @doc """
  Computes the stirling number of the second kind.
  This is how many ways you can partition n elements into k groups.

  # Example
  
  Let's say you have 10 images, how many ways can you partition those images into 3 groups?

      iex> Exmath.stirlings2(10, 3)
      9330.0
  """
  @spec stirlings2(number, number) :: float
  def stirlings2(_n, 1), do: 1
  def stirlings2(n, n), do: 1
  def stirlings2(n, k) do
    (1/factorial(k))*Enum.reduce((0..k), 0, fn(j, acc) ->
      acc + :math.pow(-1, k-j)*nCr(k, j)*:math.pow(j, n)
    end)
  end

  @doc """
  Calculates the n-th bell number.
  A bell number is how many ways you can partition n elements.

  # Example

  If you have a set of 10 images, how many different ways can you group them?

    iex> Exmath.bell_number(10)
    115_975.0
  """
  @spec bell_number(number) :: float
  def bell_number(n) do
    Enum.reduce((0..n), 0, fn(k, acc) ->
      acc + stirlings2(n, k)
    end)
  end

  # Delegate all of the default functions in erlangs math module {{{
  defdelegate acos(x), to: :math
  defdelegate acosh(x), to: :math
  defdelegate asin(x), to: :math
  defdelegate asinh(x), to: :math
  defdelegate atan(x), to: :math
  defdelegate atan2(x, y), to: :math
  defdelegate atanh(x), to: :math
  defdelegate cos(x), to: :math
  defdelegate cosh(x), to: :math
  defdelegate exp(x), to: :math
  defdelegate log(x), to: :math
  defdelegate log10(x), to: :math
  defdelegate log2(x), to: :math
  defdelegate pow(x, y), to: :math
  defdelegate sin(x), to: :math
  defdelegate sinh(x), to: :math
  defdelegate sqrt(x), to: :math
  defdelegate tan(x), to: :math
  defdelegate tanh(x), to: :math
  # }}}
end
