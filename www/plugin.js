
var exec = require('cordova/exec');

var PLUGIN_NAME = 'TimerBeep';

var TimerBeep = {
  playSingle: function() {
    exec(() => {}, null, PLUGIN_NAME, 'playSingle', []);
  },
  playFinished: function() {
    exec(() => {}, null, PLUGIN_NAME, 'playFinished', []);
  }
};

module.exports = TimerBeep;
