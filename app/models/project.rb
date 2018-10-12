class Project < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :contents
  belongs_to :user
end
