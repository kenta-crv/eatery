class Subtitle < ApplicationRecord
  belongs_to :release
  mount_uploader :file, FilesUploader
  belongs_to :user, optional: true
end
