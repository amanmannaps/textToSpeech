class AudioChannel < ApplicationCable::Channel
  def subscribed
    stream_from "audio"

    # audio_file_path = "/home/amanmanna_07/Downloads/ChatTest/test1.mp3"
    # audio_data = Base64.strict_encode64(File.read(audio_file_path))
    # ActionCable.server.broadcast "audio_stream", audio_data
  end
end
