module Currency
  extend self

  LEFT = "%u%n"
  RIGHT = "%n %u"

  def all
    [
      {code: 'USD', name: 'United States Dollar', unit: '$', format: LEFT},
      {code: 'GBP', name: 'Pound sterling', format: RIGHT},
      {code: 'EUR', name: 'Euro', format: RIGHT},
      {code: 'CHF', name: 'Swiss Franc', format: RIGHT},
      {code: 'BGN', name: 'Bulgarian Lev', format: RIGHT},
      {code: 'CZK', name: 'Czech Koruna', format: RIGHT},
      {code: 'DKK', name: 'Danish Krone', format: RIGHT},
      {code: 'HRK', name: 'Croatian Kuna', format: RIGHT},
      {code: 'HUF', name: 'Hungarian Forint', format: RIGHT},
      {code: 'ISK', name: 'Icelandic Króna', format: RIGHT},
      {code: 'NOK', name: 'Norwegian Krone', format: RIGHT},
      {code: 'PLN', name: 'Polish Złoty', format: RIGHT},
      {code: 'RON', name: 'Romanian Leu', format: RIGHT},
      {code: 'RSD', name: 'Serbian Dinar', format: RIGHT},
      {code: 'SEK', name: 'Swedish Krona', format: RIGHT},
      {code: 'AUD', name: 'Australlian Dollar', format: RIGHT},
      {code: 'CAD', name: 'Canadian Dollar', format: RIGHT},
      {code: 'NZD', name: 'New Zealand Dollar', format: RIGHT},
    ]
  end

  def find(code)
    normalized_code = normalize_code(code)

    self.all.find { |c| c[:code] == normalized_code }
  end

  private

  def normalize_code(code)
    code.to_s.upcase
  end
end
