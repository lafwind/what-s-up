class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.column_name(model)
    model_format = model.to_s.downcase
    method_name = model_format + '_name'

    define_method(method_name) do
      column = model_format + '_id'
      model.find(self.send(column.to_sym)).name
    end
  end
end
