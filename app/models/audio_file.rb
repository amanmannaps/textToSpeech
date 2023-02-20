class AudioFile < ApplicationRecord
  mount_uploader :audio, AudioUploader
end