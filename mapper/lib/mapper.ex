defmodule Mapper do

  def prepare_dictionary do

  end

  def lookup(phone) do
    prepare_dictionary()  
    store = Mnemonix.new(fizz: 1)
    Mnemonix.get(store, :fizz)
  end
end
