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

    initial_names = [
      # Two letter initials names should remain capital with and without periods
      "JJ Abrams",
      "JD Salinger",
      "AJ Michalka",
      "J. F. Kennedy",
      "J.F. Kennedy",
      # Except for some specifics
      "Mr Smith",
      "Ms Smith",
      "Dr Martin Luther King Jr",
      "St Patrick",
      "Martin Luther King Sr",
      "Lt Worf"
    ]

    %{proper_names: proper_names, initial_names: initial_names}
  end

  describe "nc/1" do
    test "should convert names to proper case", %{proper_names: proper_names} do
      for name <- proper_names do
        assert name
               |> String.downcase()
               |> NameCase.nc() == name
      end
    end

    test "should convert initials to uppercase", %{initial_names: initial_names} do
      for name <- initial_names do
        assert name
               |> String.downcase()
               |> NameCase.nc() == name
      end
    end

    test "should still convert case when `:lazy` option is false" do
      assert NameCase.nc("John oBe", lazy: false) == "John OBE"
    end

    test "should not convert roman letters when `:roman` option is false" do
      assert NameCase.nc("louis iii", roman: false) == "Louis Iii"
    end

    test "should not convert mac prefixes when `:mac_prefix` option is false" do
      assert NameCase.nc("mcdonald", mac_prefix: false) == "Mcdonald"
    end

    test "should not convert spanish conjunctions when `:spanish` option is false" do
      assert NameCase.nc("ruiz y picasso", spanish: false) == "Ruiz Y Picasso"
    end

    test "should not convert post-nominals when `:post_nominals` option is false" do
      assert NameCase.nc("john obe", post_nominals: false) == "John Obe"
    end
  end
end
