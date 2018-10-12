class Content < ApplicationRecord
  self.inheritance_column = :foo
  belongs_to :project
  belongs_to :user

  enum type: {
    map: "map",
    blueprint: "blueprint",
    market: "market",
    mapping: "mapping",
    length: "length",
    area: "area",
    volume: "volume"
  }, _prefix: :type
end