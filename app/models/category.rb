class Category < ActiveRecord::Base
  has_many :activities, inverse_of: :category

end
