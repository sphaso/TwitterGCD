defmodule MessengerTest do
  use ExUnit.Case

  def handle(), do: "@sphaso"

  test "two numbers" do
    assert Messenger.handle_input(handle(), "6 3") == "#{handle()} 3"
  end

  test "three numbers" do
    assert Messenger.handle_input(handle(), "4 6 8") == "#{handle()} 2"
  end

  test "one tag, one number" do
    assert Messenger.handle_input(handle(), "#ciao 2") == "#{handle()} 2"
  end

  test "two tags, two numbers" do
    assert Messenger.handle_input(handle(), "#ciao 2 5 #mathiscool") == "#{handle()} 1"
  end

  test "two tags, one reply, two numbers" do
    assert Messenger.handle_input(handle(), "#ciao 2 @bro 5 #mathiscool") == "#{handle()} 1"
  end

  test "invalid numbers" do
    assert Messenger.handle_input(handle(), "23.43 1111") == "#{handle()} Invalid input"
  end

  test "no number" do
    assert Messenger.handle_input(handle(), "adfbdfb") == "#{handle()} Invalid input"
  end

end
