defmodule Mapper do
  def transform(value) do
    Enum.map(String.graphemes(value), fn
      c when c == "a" -> "2"
      c when c == "b" -> "2"
      c when c == "c" -> "2"
      c when c == "d" -> "3"
      c when c == "e" -> "3"
      c when c == "f" -> "3"
      c when c == "g" -> "4"
      c when c == "h" -> "4"
      c when c == "i" -> "4"
      c when c == "j" -> "5"
      c when c == "k" -> "5"
      c when c == "l" -> "5"
      c when c == "m" -> "6"
      c when c == "n" -> "6"
      c when c == "o" -> "6"
      c when c == "p" -> "7"
      c when c == "q" -> "7"
      c when c == "r" -> "7"
      c when c == "s" -> "7"
      c when c == "t" -> "8"
      c when c == "u" -> "8"
      c when c == "v" -> "8"
      c when c == "w" -> "9"
      c when c == "x" -> "9"
      c when c == "y" -> "9"
      c when c == "z" -> "9"
      x -> x
    end)
    |> Enum.reduce(fn x, acc -> acc <> x end)
  end

  def prepare_dictionary do
    file = "dictionary/dictionary.txt"

    if File.regular?(file) == false do
      {:ok, content} = :zip.unzip(~c'dictionary/dictionary.zip', [{:cwd, ~c'dictionary/'}])
      IO.inspect(content)
    end

    list =
      File.stream!(file)
      |> Stream.map(&String.trim_trailing(&1, "\n"))
      |> Stream.filter(&(String.length(&1) < 11))
      |> Stream.filter(&(String.length(&1) >= 3))
      |> Stream.map(&String.downcase(&1))
      |> Stream.map(&{&1, transform(&1)})
      |> Enum.to_list()

    # Enum.reduce(list, %{}, fun [h|t] -> {h, &string_to_digit(h)})
  end

  def lookup(phone) do
    list = prepare_dictionary()
    store = Mnemonix.new()
    Mnemonix.get(store, :fizz)
  end
end
