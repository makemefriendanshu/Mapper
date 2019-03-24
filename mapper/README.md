# Mapper

## TODO

```elixir
Mapper.lookup(phonenumber)
```

## Usage

```elixir
iex -S mix
Mapper.prepare_dictionary()

Mapper.lookup(2282668687)
[["act", "amounts"], ["act", "contour"], ["acta", "mounts"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], "catamounts"]
Mapper.lookup(6686787825)
[["motor", "usual"], ["noun", "struck"], ["nouns", "truck"], ["nouns", "usual"], ["onto", "struck"], "motortruck"]

{[
   {["act", "bat", "cat"], ["amounts", "contour"]},
   {"acta", "mounts"},
   {nil, "mumus"},
   {nil, ["tots", "tour"]},
   {nil, ["mus", "nus", "our"]},
   {nil, nil},
   {nil, nil},
   {"catamounts", nil}
 ]}

 {[
   {["mot", "not", "oot"], nil},
   {["noun", "onto"], "struck"},
   {["motor", "nouns"], ["truck", "usual"]},
   {nil, ["puck", "ruck", "suck"]},
   {nil, "taj"},
   {nil, nil},
   {nil, nil},
   {"motortruck", nil}
 ]}
```