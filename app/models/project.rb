class Project < ApplicationRecord
  mount_uploader :photo, PhotoUploader
  has_many :contents, dependent: :destroy
  belongs_to :user
end
