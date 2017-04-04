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

  @doc """
  Hypergeometric distribution without replacement

  # Parameters
  * k -> target employed
  * nn -> total pool
  * kk -> target total
  * n -> total employed, amount to take
  """
  def hypergeometric_distribution(k, nn, kk, n) do
    (nPr(kk, k)*nPr(nn-kk, n-k))/nPr(nn, n)
  end

  def average_growth(p1, p2) when p1 == p2, do: 0.0

  @doc """
  Get the average growth-factor between two points
  """
  def average_growth({p1_x, p1_y}, {p2_x, p2_y}), do: (p2_y-p1_y)/(p2_x-p1_x)

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
