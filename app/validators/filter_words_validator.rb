class FilterWordsValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return unless value.include?(options[:in].first)

    record.errors.add(attribute, :invalid)
  end
end
