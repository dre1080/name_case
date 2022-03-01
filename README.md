# NameCase

![CI](https://github.com/dre1080/name_case/actions/workflows/ci.yml/badge.svg)

Correctly case a person's name. This is good for converting denormalized data to human friendly data.

## Installation

Add `name_case` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:name_case, "~> 0.3.0"}
  ]
end
```

## Usage

```elixir
iex(1)> NameCase.nc("LOUIS XIV")
"Louis XIV"

iex(2)> NameCase.nc("O'CALLAGHAN")
"O'Callaghan"

iex(3)> NameCase.nc("MCDONALDS")
"McDonalds"

iex(4)> NameCase.nc("LEIGH-WILLIAMS")
"Leigh-Williams"

iex(5)> NameCase.nc("ST. JOHN")
"St. John"

iex(6)> NameCase.nc("VIRGIL VAN DYKE")
"Virgil van Dyke"

iex(7)> NameCase.nc("JJ ABRAMS")
"JJ Abrams"
```

## Acknowledgements

This is an Elixir port of the [Perl](https://github.com/barbie/lingua-en-namecase), [Ruby](https://github.com/tenderlove/namecase) and [PHP](https://github.com/tamtamchik/namecase) version.
