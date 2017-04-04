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
end
