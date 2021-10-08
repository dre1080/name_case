defmodule NameCaseTest do
  use ExUnit.Case

  doctest NameCase

  setup do
    proper_names = [
      "Keith",
      "Leigh-Williams",
      "McCarthy",
      "O'Callaghan",
      "St. John",
      "von Streit",
      "van Dyke",
      "Van",
      "ap Llwyd Dafydd",
      "al Fahd",
      "Al",
      "el Grecco",
      "ben Gurion",
      "Ben",
      "da Vinci",
      "di Caprio",
      "du Pont",
      "de Legate",
      "del Crond",
      "der Sind",
      "van der Post",
      "von Trapp",
      "la Poisson",
      "le Figaro",
      "Mack Knife",
      "Dougal MacDonald",
      "Ruiz y Picasso",
      "Dato e Iradier",
      "Mas i Gavarró",
      # Mac exceptions
      "Machin",
      "Machlin",
      "Machar",
      "Mackle",
      "Macklin",
      "Mackie",
      "Macquarie",
      "Machado",
      "Macevicius",
      "Maciulis",
      "Macias",
      "MacMurdo",
      # Roman numerals
      "Henry VIII",
      "Louis III",
      "Louis XIV",
      "Charles II",
      "Fred XLIX",
      "Yusof bin Ishak",
      # Post-nominals
      "John OBE",
      "Michael David PhD",
      "Jeff Wiltord BEng"
    ]

    %{proper_names: proper_names}
  end

  test "nc/1", %{proper_names: proper_names} do
    for name <- proper_names do
      assert name
             |> String.downcase()
             |> NameCase.nc() == name
    end
  end

  test "nc/1 options" do
    assert NameCase.nc("John obe", lazy: false) == "John OBE"
    assert NameCase.nc("louis iii", roman: false) == "Louis Iii"
    assert NameCase.nc("mcdonald", mac_prefix: false) == "Mcdonald"
    assert NameCase.nc("ruiz y picasso", spanish: false) == "Ruiz Y Picasso"
    assert NameCase.nc("john obe", post_nominals: false) == "John Obe"
  end
end
