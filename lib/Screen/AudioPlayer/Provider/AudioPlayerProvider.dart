import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';

class AudioPlayerProvider extends ChangeNotifier {
  AssetsAudioPlayer? assetsAudioPlayer;
  Duration TotalDuration = Duration.zero;
  bool a = true;
  int i=0;



  List<Audio> GodAudio = [
    Audio("Assets/Audio/God/Hanuman chalisa.mp3"),
    Audio("Assets/Audio/God/Majha Bappa .mp3"),
    Audio("Assets/Audio/God/Kano Dwarika Vado.mp3"),
  ];
  List GodImage = [
    "Assets/Image/God/Hanuman chalisa.png",
    "Assets/Image/God/ganpati.jpeg",
    "Assets/Image/God/Kano Dwarika Vado.jpg",
  ];
  List GodName = [
    "Hanuman chalisa",
    "Majha Bappa",
    "Kano Dwarika Vado",
  ];

  void initAudio() {
    assetsAudioPlayer = AssetsAudioPlayer();

    assetsAudioPlayer!.open(
      autoStart: false,
      showNotification: true,
      Playlist(
        audios: GodAudio,
      ),
    );
    totalDurationAudio();
  }

  Future<void> StartAudio() async {
    await assetsAudioPlayer!.play();
  }

  Future<void> StopAudio() async {
    await assetsAudioPlayer!.pause();
  }

  void changeIcon() {
    a ? StartAudio() : StopAudio();
    a = !a;
    notifyListeners();
  }

  Future<void> NextAudio() async {
    await assetsAudioPlayer!.next();
    notifyListeners();
  }

  Future<void> BackAudio() async {
    await assetsAudioPlayer!.previous();
    notifyListeners();
  }

  void totalDurationAudio() {
    assetsAudioPlayer!.current.listen((event) {
      TotalDuration = event!.audio.duration;
      notifyListeners();
    });
  }

  void changeScreen(int value){
    i = value;
    notifyListeners();
  }
}
