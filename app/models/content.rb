class Content < ApplicationRecord
  enum type: [:map, :blueprint, :market, :mapping, :length, :area, :volume]
end
