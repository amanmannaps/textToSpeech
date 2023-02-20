class Message < ApplicationRecord
  belongs_to :user

  after_create_commit{
    # puts self
    MessageBroadcastJob.perform_later(self)
  }

  mount_uploader :audio, AudioUploader
end
