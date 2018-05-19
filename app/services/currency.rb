module Currency
  extend self

  def all
    [
      {code: 'USD', name: 'United States Dollar', unit: '$'},
      {code: 'EUR', name: 'Euro', unit: '€'},
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
