# Mapper

## Usage

```elixir
git clone https://github.com/makemefriendanshu/Mapper.git
cd Mapper/mapper/
mix deps.get
iex -S mix

Mapper.lookup(2282668687)
[["act", "amounts"], ["act", "contour"], ["acta", "mounts"], ["bat", "amounts"], ["bat", "contour"], ["cat", "contour"], "catamounts"]

Mapper.lookup(6686787825)
[["motor", "usual"], ["noun", "struck"], ["nouns", "truck"], ["nouns", "usual"], ["onto", "struck"], "motortruck"]

```

## Test

```elixir
mix test --trace

MapperTest
  * test lookup for 2282668687 (2179.1ms)
  * test lookup for 6686787825 (2029.9ms)
```