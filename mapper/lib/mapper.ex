defmodule Mapper do
  def transform(value) do
    Enum.map(String.graphemes(value), fn c ->
      if(c == "a") do
        "A"
      else
        c
      end
    end)
    |> Enum.reduce(fn x, acc -> acc <> x end)

    # value
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

  def lookup() do
    prepare_dictionary()
    store = Mnemonix.new(fizz: 1)
    Mnemonix.get(store, :fizz)
  end
end
