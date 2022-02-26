defmodule NameCase do
  @mac_prefix_name_exceptions [
    # Lithuanian
    {~r/\bMacEvicius/, "Macevicius"},
    # Portuguese
    {~r/\bMacHado/, "Machado"},
    {~r/\bMacEdo/, "Macedo"},
    {~r/\bMacHar/, "Machar"},
    {~r/\bMacHin/, "Machin"},
    {~r/\bMacHlin/, "Machlin"},
    {~r/\bMacIas/, "Macias"},
    {~r/\bMacIulis/, "Maciulis"},
    {~r/\bMacKie/, "Mackie"},
    {~r/\bMacKle/, "Mackle"},
    {~r/\bMacKlin/, "Macklin"},
    {~r/\bMacKmin/, "Mackmin"},
    {~r/\bMacQuarie/, "Macquarie"},
    {~r/\bMacOmber/, "Macomber"},
    {~r/\bMacIn/, "Macin"},
    {~r/\bMacKintosh/, "Mackintosh"},
    {~r/\bMacKen/, "Macken"},
    {~r/\bMacHen/, "Machen"},
    {~r/\bMacisaac/, "MacIsaac"},
    {~r/\bMacHiel/, "Machiel"},
    {~r/\bMacIol/, "Maciol"},
    {~r/\bMacKell/, "Mackell"},
    {~r/\bMacKlem/, "Macklem"},
    {~r/\bMacKrell/, "Mackrell"},
    {~r/\bMacLin/, "Maclin"},
    {~r/\bMacKey/, "Mackey"},
    {~r/\bMacKley/, "Mackley"},
    {~r/\bMacHell/, "Machell"},
    {~r/\bMacHon/, "Machon"}
  ]

  @general_replacements [
    # al Arabic or forename Al.
    {~r/\bAl(?=\s+\w)/, "al"},
    # ap Welsh.
    {~r/\bAp\b/, "ap"},
    # bin, binti, binte Arabic.
    {~r/\b(Bin|Binti|Binte)\b/, "bin"},
    # ben Hebrew or forename Ben.
    {~r/\bBen(?=\s+\w)/, "ben"},
    # bat Hebrew or forename Bat.
    {~r/\bBat(?=\s+\w)/, "bat"},
    # della and delle Italian.
    {~r/\bDell([ae])\b/, "dell\\1"},
    # da, de, di Italian; du French; do Brasil.
    {~r/\bD([aeiou])\b/, "d\\1"},
    # das, dos Brasileiros.
    {~r/\bD([ao]s)\b/, "d\\1"},
    # del Italian; der/den Dutch/Flemish.
    {~r/\bDe([lrn])\b/, "de\\1"},
    # el Greek or El Spanish.
    {~r/\bEl\b/, "el"},
    # la French or La Spanish.
    {~r/\bLa\b/, "la"},
    # lo Italian; le French.
    {~r/\bL([eo])\b/, "l\\1"},
    # ten, ter Dutch/Flemish.
    {~r/\bTe([rn])\b/, "te\\1"},
    # van German or forename Van.
    {~r/\bVan(?=\s+\w)/, "van"},
    # von Dutch/Flemish.
    {~r/\bVon\b/, "von"}
  ]

  @spanish_conjunctions ~w(Y E I)

  @roman_regex ~r/\b((?:[Xx]{1,3}|[Xx][Ll]|[Ll][Xx]{0,3})?(?:[Ii]{1,3}|[Ii][VvXx]|[Vv][Ii]{0,3})?)\b/

  @post_nominals ~w(
    ACILEx ACSM ADC AEPC AFC AFM AICSM AKC AM ARBRIBA ARCS ARRC ARSM AUH AUS
    BA BArch BCh BChir BCL BDS BEd BEM BEng BM BS BSc BSW BVM&S BVScBVetMed
    CB CBE CEng CertHE CGC CGM CH CIE CMarEngCMarSci CMarTech CMG CMILT CML CPhT CPLCTP CPM CQSW CSciTeach CSI CTL CVO
    DBE DBEnv DC DCB DCM DCMG DConstMgt DCVO DD DEM DFC DFM DIC Dip DipHE DipLP DipSW DL DLitt DLP DPhil DProf DPT DREst DSC DSM DSO DSocSci
    ED EdD EJLog EMLog EN EngD EngTech ERD ESLog
    FADO FAWM FBDOFCOptom FCEM FCILEx FCILT FCSP. FdAFdSc FdEng FFHOM FFPM FRCAFFPMRCA FRCGP FRCOG FRCP FRCPsych FRCS FRCVS FSCR.
    GBE GC GCB GCIE GCILEx GCMG GCSI GCVO GM
    HNC HNCert HND HNDip
    ICTTech IDSM IEng IMarEng IOMCPM ISO
    J JP JrLog
    KBE KC KCB KCIE KCMG KCSI KCVO KG KP KT
    LFHOM LG LJ LLB LLD LLM Log LPE LVO
    MA MAcc MAnth MArch MarEngTech MB MBA MBChB MBE MBEIOM MBiochem MC MCEM MCGI MCh. MChem MChiro MClinRes MComp MCOptom MCSM MCSP MD MEarthSc MEng MEnt MEP MFHOM MFin MFPM MGeol MILT MJur MLA MLitt MM MMath MMathStat MMORSE MMus MOst MP MPAMEd MPharm MPhil MPhys MRCGP MRCOG MRCP MRCPath MRCPCHFRCPCH MRCPsych MRCS MRCVS MRes MSc MScChiro MSci MSCR MSM MSocSc MSP MSt MSW MSYP MVO
    NPQH
    OBE OBI OM OND
    PgC PGCAP PGCE PgCert PGCHE PgCLTHE PgD PGDE PgDip PhD PLog PLS
    QAM QC QFSM QGM QHC QHDS QHNS QHP QHS QPM QS QTSCSci
    RD RFHN RGN RHV RIAI RIAS RM RMN RN RN1RNA RN2 RN3 RN4 RN5 RN6 RN7 RN8 RN9 RNC RNLD RNMH ROH RRC RSAW RSci RSciTech RSCN RSN RVM RVN
    SCHM SCJ SCLD SEN SGM SL SPANSPMH SPCC SPCN SPDN SPHP SPLD SrLog SRN SROT
    TD
    UD
    V100 V200 V300 VC VD VetMB VN VRD
  )

  @downcase_words ~w(The Of And)

  # Most two-letter words with no vowels should be kept in all caps as initials
  @initial_name_regex ~r/\b(Aj|[bcdfghjklmnpqrstvwxyzBCDFGHJKLMNPQRSTVWXYZ]{2})\s/

  @initial_name_exceptions ~w(Mr Dr St Jr Sr Ms Lt)

  @doc """
  Returns a properly namecased `name`.

  ## Options

    * `:lazy`          - whether to skip mixed case names (defaults to `true`)
    * `:mac_prefix`    - whether to fix Mac/Mc prefix names (defaults to `true`)
    * `:spanish`       - whether to fix Spanish names (defaults to `true`)
    * `:roman`         - whether to fix roman numeral cases, eg. XI, XII (defaults to `true`)
    * `:post_nominals` - whether to fix post-nominal letter cases, eg. OBE, PhD (defaults to `true`)

  ## Examples

      iex> NameCase.nc("MCDONALDS")
      "McDonalds"

      iex> NameCase.nc("LEIGH-WILLIAMS")
      "Leigh-Williams"

      iex> NameCase.nc("ST. jOhN", lazy: false)
      "St. John"

  """
  def nc(name, opts \\ []) when is_binary(name) do
    lazy? = Keyword.get(opts, :lazy, true)

    if lazy? && mixed_case?(name) do
      name
    else
      capitalize(name)
      |> update_general_replacements()
      |> update_initial_names()
      |> update_downcase_words()
      |> maybe_update_mac_prefix(opts)
      |> maybe_update_roman(opts)
      |> maybe_update_spanish_conjunctions(opts)
      |> maybe_update_post_nominals(opts)
    end
  end

  defp mixed_case?(name) do
    first_letter_lower? = String.match?(name, ~r/^[a-z]/)
    all_lower_or_upper? = String.downcase(name) == name || String.upcase(name) == name
    !(first_letter_lower? || all_lower_or_upper?)
  end

  defp capitalize(name) do
    name
    |> String.downcase()
    |> String.replace(~r/\b\w/, &String.upcase/1)
    # Lowercase 's
    |> String.replace(~r/'\w\b/, &String.downcase/1)
  end

  defp update_general_replacements(name) do
    Enum.reduce(@general_replacements, name, fn {pattern, replacement}, acc ->
      String.replace(acc, pattern, replacement)
    end)
  end

  def update_initial_names(name) do
    String.replace(name, @initial_name_regex, fn initial_name ->
      if Enum.member?(@initial_name_exceptions, String.trim(initial_name)) do
        initial_name
      else
        String.upcase(initial_name)
      end
    end)
  end

  defp update_downcase_words(name) do
    Enum.reduce(@downcase_words, name, fn word, acc ->
      word_regex = Regex.compile!("\\b#{word}\\b")
      String.replace(acc, word_regex, String.downcase(acc))
    end)
  end

  defp maybe_update_roman(name, opts) do
    update_roman? = Keyword.get(opts, :roman, true)

    if update_roman? do
      Regex.replace(@roman_regex, name, &String.upcase/1)
    else
      name
    end
  end

  defp maybe_update_mac_prefix(name, opts) do
    update_mac_prefix? = Keyword.get(opts, :mac_prefix, true)

    if update_mac_prefix? do
      name =
        if String.match?(name, ~r/.*?\bMac[A-Za-z]{2,}[^aciozj]\b/) ||
             String.match?(name, ~r/.*?\bMc/) do
          fix_mac_prefix_exceptions(name)
        else
          name
        end

      String.replace(name, "Macmurdo", "MacMurdo")
    else
      name
    end
  end

  defp fix_mac_prefix_exceptions(name) do
    name =
      Regex.replace(~r/\b(Ma?c)([A-Za-z]+)/, name, fn _, mac_prefix, rest ->
        mac_prefix <> String.capitalize(rest)
      end)

    Enum.reduce(@mac_prefix_name_exceptions, name, fn {pattern, replacement}, acc ->
      String.replace(acc, pattern, replacement)
    end)
  end

  defp maybe_update_spanish_conjunctions(name, opts) do
    update_spanish_conjunctions? = Keyword.get(opts, :spanish, true)

    if update_spanish_conjunctions? do
      Enum.reduce(@spanish_conjunctions, name, fn conjunction, acc ->
        conjunction_regex = Regex.compile!("\\b#{conjunction}\\b")
        String.replace(acc, conjunction_regex, String.downcase(conjunction))
      end)
    else
      name
    end
  end

  defp maybe_update_post_nominals(name, opts) do
    update_post_nominals? = Keyword.get(opts, :post_nominals, true)

    if update_post_nominals? do
      Enum.reduce(@post_nominals, name, fn post_nominal, acc ->
        post_nominal_regex = Regex.compile!("\\b#{post_nominal}\\b", "ix")
        String.replace(acc, post_nominal_regex, post_nominal)
      end)
    else
      name
    end
  end
end
