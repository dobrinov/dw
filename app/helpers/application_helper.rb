module ApplicationHelper
  def localised_number_to_currency(currency_code, amount)
    currency = Currency.find currency_code
    unit = currency[:unit].present? ? currency[:unit] : currency[:code]

    number_to_currency amount, unit: unit,
                               format: currency[:format],
                               precision: 0
  end
end
