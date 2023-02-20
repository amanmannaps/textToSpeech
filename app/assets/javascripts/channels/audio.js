App.audio = App.cable.subscriptions.create("AudioChannel", {
connected: function() {
    console.log("Connected to the Audio channel");
    },
    disconnected: function() {
    console.log("Disconnected to the Audio channel");
    },
  received: function(data) {  
    // console.log(data.audioData);
    let audioSource=document.querySelector('#audio-source');
    let audioPlayer=document.querySelector('#audio');
    // console.log(audioSource,audioPlayer);
    // console.log(data);
    // console.log(audioPlayer);
    audioSource.setAttribute("src", "data:audio/mpeg;base64," + data.audioData);
    audioPlayer.load();
    audioPlayer.play();
  }
});