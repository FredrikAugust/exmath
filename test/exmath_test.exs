defmodule ExmathTest do
  use ExUnit.Case
  doctest Exmath

  test "factorial of 0 is 1" do
    assert Exmath.factorial(0) == 1
  end

  test "factorial of 4 is 24" do
    assert Exmath.factorial(4) == 24
  end

  test "nCr of 8 and 3 is 56" do
    assert Exmath.nCr(8, 3) == 56
  end

  test "nCr of 0 and 0 is 1" do
    assert Exmath.nCr(0, 0) == 1
  end

  test "nPr of 0 and 0 is 1" do
    assert Exmath.nPr(0, 0) == 1
  end

  test "nPr of 5 and 5 is 120" do
    assert Exmath.nPr(5, 5) == 120
  end

  test "prints first row of pascals triangle" do
    assert Exmath.pascals_triangle_row(0) == [1.0]
  end

  test "prints 5th row of pascals triangle" do
    assert Exmath.pascals_triangle_row(4) == [1.0, 4.0, 6.0, 4.0, 1.0]
  end

  test "hypergeometric distribution" do
    # The probability that neither of the next two cards turned are clubs
    assert Float.round(Exmath.hypergeometric_distribution(0, 47, 9, 2), 2) == 0.65
  end

  test "average growth between two points" do
    assert Exmath.average_growth({1, 1}, {2, 2}) == 1.0
  end

  test "average growth in same point" do
    assert Exmath.average_growth({1, 1}, {1, 1}) == 0.0
  end

  test "stirling number of the second kind" do
    assert Exmath.stirlings2(3, 1) == 1
    assert Exmath.stirlings2(3, 2) == 3
    assert Exmath.stirlings2(3, 3) == 1
  end

  test "bell numbers" do
    assert Exmath.bell_number(0) == 1
    assert Exmath.bell_number(1) == 1
    assert Exmath.bell_number(2) == 2
    assert Exmath.bell_number(6) == 203
  end
end
