// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

const manifestUri = 'https://dxhzau39q4hos.cloudfront.net/bears/playlist.m3u8';



$(document).on("turbolinks:load", () => {
    console.log('lol')
    var video = document.getElementById('video');
    if (video.canPlayType('application/vnd.apple.mpegurl')) {
        video.src = manifestUri;
        video.addEventListener('loadedmetadata', function() {
          video.play();
        });
      //
      // If no native HLS support, check if hls.js is supported
      //
      } else if (Hls.isSupported()) {
        var hls = new Hls();
        hls.loadSource(manifestUri);
        hls.attachMedia(video);
        hls.on(Hls.Events.MANIFEST_PARSED, function() {
          video.play();
        });
      }
})