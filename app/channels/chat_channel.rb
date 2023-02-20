class ChatChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "chat"
    # stream_from "messages_#{params[:room_id]}:messages"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def speak(data)
  #   message = Message.create!(audio: data['message']['audio'], user_id: data['message']['user_id'], room_id: data['room_id'])
  #   socket = { message: message.to_json, room_id: data['room_id'] }
  #   MessagesChannel.broadcast_to("messages_#{data['room_id']}:messages", socket)
  # end
  
end
