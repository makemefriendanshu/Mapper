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
    |> String.to_atom()
  end

  def prepare_dictionary do
    file = "dictionary/dictionary.txt"

    if File.regular?(file) == false do
      {:ok, content} = :zip.unzip(~c'dictionary/dictionary.zip', [{:cwd, ~c'dictionary/'}])
      IO.inspect(content)
    end

    store = Mnemonix.new()

    list =
      File.stream!(file)
      |> Stream.map(&String.trim_trailing(&1, "\n"))
      |> Stream.filter(&(String.length(&1) < 11))
      |> Stream.filter(&(String.length(&1) >= 3))
      |> Stream.filter(&(String.length(&1) != 8))
      |> Stream.filter(&(String.length(&1) != 9))
      |> Stream.map(&String.downcase(&1))
      |> Stream.map(&{&1, transform(&1)})
      |> Enum.to_list()
      |> Enum.map(fn {k, v} ->
        in_store = Mnemonix.get(store, v)

        if in_store == nil do
          Mnemonix.put_new(store, v, k)
        else
          if is_list(in_store) do
            Mnemonix.put(store, v, in_store ++ [k])
          else
            Mnemonix.put(store, v, [in_store] ++ [k])
          end
        end
      end)

    store

    # Enum.reduce(list, %{}, fun [h|t] -> {h, &string_to_digit(h)})
  end

  def lookup(phone) do
    store = prepare_dictionary()
    phone = Kernel.inspect(phone)

    if(!(phone =~ "0" || phone =~ "1")) do
      {
        terms =
          2..9
          |> Enum.map(fn n ->
            sub = String.slice(phone, 0..n)
            {sub |> String.to_atom(), String.replace(phone, sub, "") |> String.to_atom()}
          end)
          |> Enum.map(fn {w, x} ->
            {Mnemonix.get(store, w), Mnemonix.get(store, x)}
          end)
        # |> Enum.map(fn
        #   {k, v} ->
        #     if(k == nil || v == nil) do
        #       break
        #     end

        #     if(is_binary(k) && is_binary(v)) do
        #       [k] ++ [v]
        #       break
        #     end

        #     if(is_binary(k) && is_list(v)) do
        #       Enum.reduce(v, [], fn x, acc -> [k, x | acc] end)
        #     end

        #     if(is_list(k) && is_binary(v)) do
        #       Enum.reduce(k, [], fn x, acc -> [x, v | acc] end)
        #     end

        # if(is_list(k) && is_list(v)) do
        #   Enum.reduce(k, [], fn x, acc -> Enum.map(v, fn d, x, acc -> [d, x | acc] end) end)
        # end
        # end)

        # [h|t]= terms |> Tuple.to_list
        # h|> Enum.map(fn {k, v} -> k end)
      }
    end
  end
end
