class RemoveAudioSizeJob < ApplicationJob
    queue_as :default
  
    def perform()
      # Do something later
      # puts message
      $audio_queue_size-=1
    end
  
  
end
  