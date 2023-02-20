class AudioPlayJob < ApplicationJob
    queue_as :default
  
    def perform(audio_data)
      # Do something later
      # puts message
      ActionCable.server.broadcast "audio", {
        audioData: audio_data
      }
    end
  
  
end
  