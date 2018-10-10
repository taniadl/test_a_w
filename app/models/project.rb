class Project < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :content
end
