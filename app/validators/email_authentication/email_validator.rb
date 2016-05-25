module EmailAuthentication
  class EmailValidator < ActiveModel::EachValidator
    def validate_each(record, attribute, value)
      unless value.blank?
        unless value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
          record.errors[attribute] << (options[:message] || "is not valid")
        end
      end
    end
  end
end