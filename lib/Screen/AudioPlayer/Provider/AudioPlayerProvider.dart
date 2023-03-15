import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioPlayerProvider extends ChangeNotifier {
  AssetsAudioPlayer? assetsAudioPlayer;
  int i=0;
  List AudioLsit = [
    "Assets/Audio/sakti bhakti.mp3",
    "Assets/Audio/man_mari_jaan.mp3",
    "Assets/Audio/mc_stan.mp3",
  ];

  List Image1 = [
    "Assets/Image/sakti bhakti.jpg",
    "Assets/Image/man_meri_jaan.jpg",
    "Assets/Image/mc_stan.jpg",
  ];

  void initAudio() {
    assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer!.open(Audio(AudioLsit[2]),autoStart: false,showNotification: true);
  }

  Future<void> StartAudio() async {
    await assetsAudioPlayer!.play();
  }


  Future<void> StopAudio() async {
    await assetsAudioPlayer!.pause();
  }


  void NextAudio() {
    i++;
    notifyListeners();
  }
  void BackAudio() {
    i--;
    notifyListeners();
  }
}
