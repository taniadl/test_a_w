class Content < ApplicationRecord
self.inheritance_column = :foo

  belongs_to :project

  enum type: {
    blueprint: "blueprint",
    market: "market",
    mapping: "mapping",
    area: "area",
    volume: "volume"
  }, _prefix: :type
end
