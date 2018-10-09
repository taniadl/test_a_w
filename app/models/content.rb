class Content < ApplicationRecord
  self.inheritance_column = :foo

  enum type: {
    blueprint: "blueprint",
    market: "market",
    mapping: "mapping",
    area: "area",
    volume: "volume"
  }, _prefix: :type
end
