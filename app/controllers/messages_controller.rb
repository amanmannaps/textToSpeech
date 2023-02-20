class MessagesController < ApplicationController
  before_action :authenticate_user!

 def create
    @message = Message.new(message_params)
    @message.user = current_user
    @message.save

    txt = message_params["body"].to_s

    polly = Aws::Polly::Client.new(
    region: 'ap-south-1',
    access_key_id: 'YourAccessId',
    secret_access_key: 'YourAccessKey'
    )

    response = polly.synthesize_speech(
    voice_id: 'Aditi',
    output_format: 'mp3',
    text: txt
    )

    audio_data = Base64.strict_encode64(response.audio_stream.read)

    AudioPlayJob.perform_later(audio_data)

    
  end


  private
  def message_params
    params.require(:message).permit(:body, :audio)
  end


end
