class UrlValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value.blank?

    url = URI.parse value

    if url.host.blank?
      record.errors.add(attribute, 'invalid URL format. Valid example: https://www.example.com')
    end
  end
end
