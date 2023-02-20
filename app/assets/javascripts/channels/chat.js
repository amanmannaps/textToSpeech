App.chat = App.cable.subscriptions.create("ChatChannel", {
  connected: function() {
    console.log("Connected to the chat channel");
  },
  disconnected: function() {
    console.log("Disconnected to the chat channel");
  },
  received: function(data) {
    // console.log(data['message']);
    var messages = $('#chatbox');
    messages.append(data['message']);
    messages.scrollTop(messages[0].scrollHeight);
  }
});