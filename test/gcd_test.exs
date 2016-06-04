defmodule GcdTest do
  use ExUnit.Case
  
  test "gcd 2 postive numbers" do
    assert Gcd.gcd([6,3]) == 3
  end

  test "gcd 2 negative numbers" do
    assert Gcd.gcd([-6, -3]) == 3
  end

  test "gcd 3 positive numbers" do
    assert Gcd.gcd([27,18,9]) == 9
  end

  test "gcd 3 negative numbers" do
    assert Gcd.gcd([-27,-18,-9]) == 9
  end

end
