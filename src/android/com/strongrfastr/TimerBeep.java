/**
 */
package com.strongrfastr;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.apache.cordova.PluginResult;
import org.apache.cordova.PluginResult.Status;
import org.json.JSONObject;
import org.json.JSONArray;
import org.json.JSONException;

import android.util.Log;
import android.os.Bundle;
import android.media.MediaPlayer;

import java.util.Date;

public class TimerBeep extends CordovaPlugin {
  private static final String TAG = "TimerBeep";

  public void initialize(CordovaInterface cordova, CordovaWebView webView) {
    super.initialize(cordova, webView);
  }

  public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
    if(action.equals("playSingle")) {
      MediaPlayer mp = MediaPlayer.create(this.cordova.getActivity().getApplicationContext(), cordova.getActivity().getResources().getIdentifier("beep", "raw", cordova.getActivity().getPackageName()));
      mp.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mediaPlayer) {
                mediaPlayer.release();
            }
      });
      mp.start();
    } else if(action.equals("playFinished")) {
      MediaPlayer mp = MediaPlayer.create(this.cordova.getActivity().getApplicationContext(), cordova.getActivity().getResources().getIdentifier("finished", "raw", cordova.getActivity().getPackageName()));
      mp.setOnCompletionListener(new MediaPlayer.OnCompletionListener() {
            @Override
            public void onCompletion(MediaPlayer mediaPlayer) {
                mediaPlayer.release();
            }
      });
      mp.start();
    }
    return true;
  }

}
