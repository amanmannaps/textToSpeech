class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message)
    # Do something later
    # puts message
    ActionCable.server.broadcast "chat", {
      message: render_message(message)
    }
  end


  private
  def render_message(message)
    # puts message
    MessagesController.render(
      partial: 'message',
      locals:{
        message: message
      })
  end
end
