class MessagesController < ApplicationController
  before_action :authenticate_user!
  $audio_queue_size= 0
  @@LastSetTime= Time.now.to_i
 def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save

    txt = message_params["body"].to_s

    polly = Aws::Polly::Client.new(
    region: 'ap-south-1',
    access_key_id: 'AKIAZKM2O7PAYBG2LHUZ',
    secret_access_key: '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'
    )

    response = polly.synthesize_speech(
    voice_id: 'Aditi',
    output_format: 'mp3',
    text: txt
    )

    audio_data = Base64.strict_encode64(response.audio_stream.read)
    
    if $audio_queue_size==0
      @@LastSetTime= Time.now.to_i
    else
      @@LastSetTime += 10
    end
    
    AudioPlayJob.set(wait_until: (@@LastSetTime-Time.now.to_i).seconds.from_now).perform_later(audio_data)
    $audio_queue_size+=1
    RemoveAudioSizeJob.set(wait_until: (@@LastSetTime+10-Time.now.to_i).seconds.from_now).perform_later();

  end


  private
    def message_params
      params.require(:message).permit(:body, :audio)
    end

end
