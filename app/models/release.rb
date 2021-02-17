class Release < ApplicationRecord
  has_many :subtitles
  mount_uploader :file, FilesUploader
  belongs_to :user, optional: true
end
