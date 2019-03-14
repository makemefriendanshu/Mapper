defmodule Mapper do
  def prepare_dictionary do
    file = "dictionary/dictionary.txt"

    if File.regular?(file) == false do
      {:ok, content} = :zip.unzip(~c'dictionary/dictionary.zip', [{:cwd, ~c'dictionary/'}])
      IO.inspect(content)
    end

    words =
      File.stream!(file)
      |> Stream.map(&String.trim_trailing/1)
      |> Enum.to_list()
      |> List.to_tuple()
      |> IO.puts()

    case File.read(file) do
      {:ok, body} ->
        String.split(body)
        |> length
        |> IO.puts()

      {:error, reason} ->
        "Could not read file #{file} because #{reason}"
        |> IO.puts()
    end
  end

  def lookup() do
    prepare_dictionary()
    store = Mnemonix.new(fizz: 1)
    Mnemonix.get(store, :fizz)
  end
end
