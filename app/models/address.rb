class Address < ApplicationRecord
  belongs_to :buyer
  belongs_to :prefecture
end
